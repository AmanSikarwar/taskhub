import 'dart:async';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/project.dart';
import '../../domain/entities/project_failure.dart';
import '../../domain/entities/project_member.dart';
import '../../domain/repositories/project_repository.dart';
import '../../../../core/utils/realtime_utils.dart';

@LazySingleton(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
  final SupabaseClient _supabase;

  ProjectRepositoryImpl(this._supabase);

  String? get _currentUserId => _supabase.auth.currentUser?.id;

  @override
  Future<({List<ProjectWithRole>? projects, ProjectFailure? failure})>
  getProjects() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (projects: null, failure: const ProjectFailure.unauthorized());
      }

      final response = await _supabase
          .from('projects')
          .select('''
            *,
            project_members!inner(role),
            tasks(id, status)
          ''')
          .eq('project_members.user_id', userId)
          .order('created_at', ascending: false);

      final projects = (response as List).map((json) {
        final project = Project(
          id: json['id'] as String,
          ownerId: json['owner_id'] as String,
          title: json['title'] as String,
          description: json['description'] as String?,
          dueDate: json['due_date'] != null
              ? DateTime.parse(json['due_date'] as String)
              : null,
          colorCode: json['color_code'] as String,
          createdAt: DateTime.parse(json['created_at'] as String),
          updatedAt: DateTime.parse(json['updated_at'] as String),
        );

        final memberData = json['project_members'] as List;
        final role = memberData.isNotEmpty
            ? _parseProjectRole(memberData.first['role'] as String)
            : ProjectRole.viewer;

        final tasks = json['tasks'] as List? ?? [];
        final taskCount = tasks.length;
        final completedTaskCount = tasks
            .where((t) => t['status'] == 'completed')
            .length;

        return ProjectWithRole(
          project: project,
          role: role,
          taskCount: taskCount,
          completedTaskCount: completedTaskCount,
        );
      }).toList();

      return (projects: projects, failure: null);
    } on PostgrestException catch (e) {
      developer.log(
        'PostgrestException: ${e.message}',
        name: 'ProjectRepository',
      );
      return (projects: null, failure: _mapPostgrestException(e));
    } catch (e) {
      developer.log('Error getting projects: $e', name: 'ProjectRepository');
      return (projects: null, failure: ProjectFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({Project? project, ProjectFailure? failure})> getProject(
    String projectId,
  ) async {
    try {
      final response = await _supabase
          .from('projects')
          .select()
          .eq('id', projectId)
          .single();

      final project = _mapToProject(response);
      return (project: project, failure: null);
    } on PostgrestException catch (e) {
      if (e.code == 'PGRST116') {
        return (project: null, failure: const ProjectFailure.notFound());
      }
      return (project: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (project: null, failure: ProjectFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({List<ProjectMember>? members, ProjectFailure? failure})>
  getProjectMembers(String projectId) async {
    try {
      final response = await _supabase
          .from('project_members')
          .select('''
            *,
            profiles(email, display_name, avatar_url)
          ''')
          .eq('project_id', projectId)
          .order('joined_at');

      final members = (response as List).map((json) {
        final profile = json['profiles'] as Map<String, dynamic>?;
        return ProjectMember(
          projectId: json['project_id'] as String,
          userId: json['user_id'] as String,
          role: _parseProjectRole(json['role'] as String),
          joinedAt: DateTime.parse(json['joined_at'] as String),
          email: profile?['email'] as String?,
          displayName: profile?['display_name'] as String?,
          avatarUrl: profile?['avatar_url'] as String?,
        );
      }).toList();

      return (members: members, failure: null);
    } on PostgrestException catch (e) {
      return (members: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (members: null, failure: ProjectFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({Project? project, ProjectFailure? failure})> createProject({
    required String title,
    String? description,
    DateTime? dueDate,
    String? colorCode,
  }) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (project: null, failure: const ProjectFailure.unauthorized());
      }

      final response = await _supabase
          .from('projects')
          .insert({
            'owner_id': userId,
            'title': title,
            'description': description,
            'due_date': dueDate?.toIso8601String(),
            'color_code': colorCode ?? '#6366F1',
          })
          .select()
          .single();

      final project = _mapToProject(response);
      return (project: project, failure: null);
    } on PostgrestException catch (e) {
      if (e.message.contains('projects_title_length')) {
        return (project: null, failure: const ProjectFailure.invalidTitle());
      }
      if (e.message.contains('projects_color_code_format')) {
        return (
          project: null,
          failure: const ProjectFailure.invalidColorCode(),
        );
      }
      return (project: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (project: null, failure: ProjectFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({Project? project, ProjectFailure? failure})> updateProject({
    required String projectId,
    String? title,
    String? description,
    DateTime? dueDate,
    String? colorCode,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (title != null) {
        updates['title'] = title;
      }
      if (description != null) {
        updates['description'] = description;
      }
      if (dueDate != null) {
        updates['due_date'] = dueDate.toIso8601String();
      }
      if (colorCode != null) {
        updates['color_code'] = colorCode;
      }

      if (updates.isEmpty) {
        final result = await getProject(projectId);
        return result;
      }

      final response = await _supabase
          .from('projects')
          .update(updates)
          .eq('id', projectId)
          .select()
          .single();

      final project = _mapToProject(response);
      return (project: project, failure: null);
    } on PostgrestException catch (e) {
      if (e.message.contains('projects_title_length')) {
        return (project: null, failure: const ProjectFailure.invalidTitle());
      }
      if (e.message.contains('projects_color_code_format')) {
        return (
          project: null,
          failure: const ProjectFailure.invalidColorCode(),
        );
      }
      return (project: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (project: null, failure: ProjectFailure.unknown(e.toString()));
    }
  }

  @override
  Future<ProjectFailure?> deleteProject(String projectId) async {
    try {
      await _supabase.from('projects').delete().eq('id', projectId);
      return null;
    } on PostgrestException catch (e) {
      return _mapPostgrestException(e);
    } catch (e) {
      return ProjectFailure.unknown(e.toString());
    }
  }

  @override
  Future<({ProjectMember? member, ProjectFailure? failure})> addMember({
    required String projectId,
    required String userId, // Can be user ID (UUID) or email
    required ProjectRole role,
  }) async {
    try {
      String actualUserId = userId;

      // Check if userId is an email (if it contains @ it's likely an email)
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (emailRegex.hasMatch(userId)) {
        final userLookup = await _supabase
            .from('profiles')
            .select('id')
            .eq('email', userId)
            .maybeSingle();

        if (userLookup == null) {
          return (
            member: null,
            failure: ProjectFailure.unknown(
              'No user found with email: $userId',
            ),
          );
        }

        actualUserId = userLookup['id'] as String;
      }

      final response = await _supabase
          .from('project_members')
          .insert({
            'project_id': projectId,
            'user_id': actualUserId,
            'role': role.name,
          })
          .select('''
        *,
        profiles(email, display_name, avatar_url)
      ''')
          .single();

      final profile = response['profiles'] as Map<String, dynamic>?;
      final member = ProjectMember(
        projectId: response['project_id'] as String,
        userId: response['user_id'] as String,
        role: _parseProjectRole(response['role'] as String),
        joinedAt: DateTime.parse(response['joined_at'] as String),
        email: profile?['email'] as String?,
        displayName: profile?['display_name'] as String?,
        avatarUrl: profile?['avatar_url'] as String?,
      );

      return (member: member, failure: null);
    } on PostgrestException catch (e) {
      if (e.code == '23505') {
        return (
          member: null,
          failure: const ProjectFailure.memberAlreadyExists(),
        );
      }
      return (member: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (member: null, failure: ProjectFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({ProjectMember? member, ProjectFailure? failure})> updateMemberRole({
    required String projectId,
    required String userId,
    required ProjectRole role,
  }) async {
    try {
      final response = await _supabase
          .from('project_members')
          .update({'role': role.name})
          .eq('project_id', projectId)
          .eq('user_id', userId)
          .select('''
            *,
            profiles(email, display_name, avatar_url)
          ''')
          .single();

      final profile = response['profiles'] as Map<String, dynamic>?;
      final member = ProjectMember(
        projectId: response['project_id'] as String,
        userId: response['user_id'] as String,
        role: _parseProjectRole(response['role'] as String),
        joinedAt: DateTime.parse(response['joined_at'] as String),
        email: profile?['email'] as String?,
        displayName: profile?['display_name'] as String?,
        avatarUrl: profile?['avatar_url'] as String?,
      );

      return (member: member, failure: null);
    } on PostgrestException catch (e) {
      if (e.code == 'PGRST116') {
        return (member: null, failure: const ProjectFailure.memberNotFound());
      }
      return (member: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (member: null, failure: ProjectFailure.unknown(e.toString()));
    }
  }

  @override
  Future<ProjectFailure?> removeMember({
    required String projectId,
    required String userId,
  }) async {
    try {
      final projectResult = await getProject(projectId);
      if (projectResult.project?.ownerId == userId) {
        return const ProjectFailure.cannotRemoveOwner();
      }

      await _supabase
          .from('project_members')
          .delete()
          .eq('project_id', projectId)
          .eq('user_id', userId);

      return null;
    } on PostgrestException catch (e) {
      return _mapPostgrestException(e);
    } catch (e) {
      return ProjectFailure.unknown(e.toString());
    }
  }

  @override
  Future<ProjectFailure?> leaveProject(String projectId) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return const ProjectFailure.unauthorized();
      }
      final projectResult = await getProject(projectId);
      if (projectResult.project?.ownerId == userId) {
        return const ProjectFailure.cannotRemoveOwner();
      }

      await _supabase
          .from('project_members')
          .delete()
          .eq('project_id', projectId)
          .eq('user_id', userId);

      return null;
    } on PostgrestException catch (e) {
      return _mapPostgrestException(e);
    } catch (e) {
      return ProjectFailure.unknown(e.toString());
    }
  }

  @override
  Stream<List<ProjectWithRole>> watchProjects() {
    final userId = _currentUserId;
    if (userId == null) {
      return Stream.value([]);
    }

    return RealtimeUtils.safeStream(
      () => _supabase.from('projects').stream(primaryKey: ['id']).asyncMap((
        _,
      ) async {
        final result = await getProjects();
        if (result.failure != null) {
          throw Exception('Failed to fetch projects: ${result.failure}');
        }
        return result.projects ?? [];
      }),
      logName: 'watchProjects',
    );
  }

  Project _mapToProject(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      dueDate: json['due_date'] != null
          ? DateTime.parse(json['due_date'] as String)
          : null,
      colorCode: json['color_code'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  ProjectRole _parseProjectRole(String role) {
    return ProjectRole.values.firstWhere(
      (e) => e.name == role,
      orElse: () => ProjectRole.viewer,
    );
  }

  ProjectFailure _mapPostgrestException(PostgrestException e) {
    final message = e.message.toLowerCase();
    final code = e.code;

    if (code == '42501' || message.contains('permission denied')) {
      return const ProjectFailure.forbidden();
    }

    if (code == 'PGRST116') {
      return const ProjectFailure.notFound();
    }

    if (message.contains('network') || message.contains('connection')) {
      return const ProjectFailure.networkError();
    }

    return ProjectFailure.serverError(e.message);
  }
}
