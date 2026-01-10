import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/app_bottom_sheets.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../notifications/presentation/widgets/bottomsheet_options.dart';
import '../../../tasks/domain/entities/task.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../../tasks/presentation/widgets/create_task_dialog.dart';
import '../../domain/entities/project.dart';
import '../bloc/project_bloc.dart';
import 'members_sheet.dart';
import 'role_options.dart';

class ProjectHeader extends StatelessWidget {
  final Project? project;
  final String projectId;

  const ProjectHeader({
    super.key,
    required this.project,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final projectColor = AppUtils.parseColor(project?.colorCode ?? '#FFC107');

    return Padding(
      padding: const .all(20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              FTappable(
                onPress: () => context.pop(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.backgroundCard,
                    borderRadius: .circular(12),
                    border: .all(color: colors.border),
                  ),
                  child: Icon(
                    FIcons.arrowLeft,
                    color: colors.textPrimary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Project Details',
                  style: context.theme.typography.lg.copyWith(
                    fontWeight: .bold,
                    color: colors.textPrimary,
                  ),
                ),
              ),
              // Members button
              FTappable(
                onPress: () => _showMembersSheet(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.backgroundCard,
                    borderRadius: .circular(12),
                    border: .all(color: colors.border),
                  ),
                  child: Icon(
                    FIcons.users,
                    color: colors.textSecondary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              FTappable(
                onPress: () => _showOptionsMenu(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.backgroundCard,
                    borderRadius: .circular(12),
                    border: .all(color: colors.border),
                  ),
                  child: Icon(
                    FIcons.ellipsisVertical,
                    color: colors.textSecondary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          if (project != null) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FButton(
                    onPress: () => _showCreateTaskDialog(context),
                    prefix: const Icon(FIcons.plus, size: 16),
                    child: const Text('New Task'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FButton(
                    onPress: () => _showInviteMemberDialog(context),
                    style: FButtonStyle.secondary(),
                    prefix: const Icon(FIcons.userPlus, size: 16),
                    child: const Text('Add Member'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Container(
              padding: const .all(20),
              decoration: BoxDecoration(
                color: colors.backgroundCard,
                borderRadius: .circular(16),
                border: .all(color: colors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: projectColor.withValues(alpha: 0.2),
                      borderRadius: .circular(14),
                    ),
                    child: Icon(FIcons.folder, color: projectColor, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          project!.title,
                          style: context.theme.typography.lg.copyWith(
                            fontWeight: .bold,
                            color: colors.textPrimary,
                          ),
                        ),
                        if (project!.description != null &&
                            project!.description!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            project!.description!,
                            style: context.theme.typography.sm.copyWith(
                              color: colors.textSecondary,
                            ),
                            maxLines: 2,
                            overflow: .ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      final tasks = state.maybeWhen(
                        tasksLoaded: (tasks) => tasks,
                        orElse: () => <Task>[],
                      );
                      final completedCount = tasks
                          .where((t) => t.status == .completed)
                          .length;
                      final progress = tasks.isEmpty
                          ? 0.0
                          : completedCount / tasks.length;

                      return ProjectProgressCircle(
                        progress: progress,
                        size: 52,
                        color: projectColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showCreateTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<ProjectBloc>()),
          BlocProvider(create: (_) => getIt<TaskBloc>()),
        ],
        child: CreateTaskDialog(projectId: projectId),
      ),
    );
  }

  void _showMembersSheet(BuildContext context) {
    final currentUserId = context.read<AuthBloc>().state.whenOrNull(
      authenticated: (user) => user.id,
    );
    final isOwner = project?.ownerId == currentUserId;

    showModalBottomSheet(
      context: context,
      backgroundColor: context.appColors.backgroundCard,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(20)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<ProjectBloc>(),
        child: MembersSheet(
          projectId: projectId,
          isOwner: isOwner,
          project: project,
        ),
      ),
    );
  }

  void _showOptionsMenu(BuildContext context) {
    final colors = context.appColors;

    showModalBottomSheet(
      context: context,
      backgroundColor: colors.backgroundCard,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(20)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const .symmetric(vertical: 8),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const .only(bottom: 16),
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: .circular(2),
                ),
              ),
              BottomSheetOption(
                icon: FIcons.pencil,
                label: 'Edit Project',
                onTap: () {
                  Navigator.pop(sheetContext);
                  if (project != null) {
                    _showEditProjectDialog(context, project!);
                  }
                },
              ),
              BottomSheetOption(
                icon: FIcons.userPlus,
                label: 'Invite Members',
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showInviteMemberDialog(context);
                },
              ),
              BottomSheetOption(
                icon: FIcons.trash2,
                label: 'Delete Project',
                isDestructive: true,
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showDeleteConfirmation(context);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditProjectDialog(BuildContext context, Project project) {
    final colors = context.appColors;
    final titleController = TextEditingController(text: project.title);
    final descriptionController = TextEditingController(
      text: project.description,
    );

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: colors.backgroundCard,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const .all(24),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Edit Project',
                    style: context.theme.typography.xl.copyWith(
                      fontWeight: .bold,
                      color: colors.textPrimary,
                    ),
                  ),
                  FTappable(
                    onPress: () => Navigator.pop(dialogContext),
                    child: Icon(
                      FIcons.x,
                      color: colors.textSecondary,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Project Name',
                style: context.theme.typography.sm.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              FTextField(
                control: FTextFieldControl.managed(controller: titleController),
                hint: 'Enter project name',
              ),
              const SizedBox(height: 20),
              Text(
                'Description (optional)',
                style: context.theme.typography.sm.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              FTextField(
                control: FTextFieldControl.managed(
                  controller: descriptionController,
                ),
                hint: 'Enter project description',
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: FButton(
                      onPress: () => Navigator.pop(dialogContext),
                      style: FButtonStyle.outline(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FButton(
                      onPress: () {
                        if (titleController.text.trim().isNotEmpty) {
                          context.read<ProjectBloc>().add(
                            .updateProject(
                              projectId: projectId,
                              title: titleController.text.trim(),
                              description:
                                  descriptionController.text.trim().isEmpty
                                  ? null
                                  : descriptionController.text.trim(),
                            ),
                          );
                          Navigator.pop(dialogContext);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInviteMemberDialog(BuildContext context) {
    final colors = context.appColors;
    final emailController = TextEditingController();
    ProjectRole selectedRole = ProjectRole.viewer;

    final projectBloc = context.read<ProjectBloc>();

    showAppBottomSheet(
      context: context,
      builder: (sheetContext) => StatefulBuilder(
        builder: (context, setState) => Container(
          padding: .only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Invite Member',
                      style: context.theme.typography.xl.copyWith(
                        fontWeight: .bold,
                        color: colors.textPrimary,
                      ),
                    ),
                    FTappable(
                      onPress: () => Navigator.pop(sheetContext),
                      child: Icon(
                        FIcons.x,
                        color: colors.textSecondary,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Email Address',
                  style: context.theme.typography.sm.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                FTextField(
                  control: FTextFieldControl.managed(
                    controller: emailController,
                  ),
                  hint: 'Enter email address (e.g., user@example.com)',
                  prefixBuilder: (context, style, states) =>
                      Icon(FIcons.mail, color: colors.textSecondary, size: 20),
                ),
                const SizedBox(height: 20),
                Text(
                  'Role',
                  style: context.theme.typography.sm.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    RoleOption(
                      label: 'Viewer',
                      isSelected: selectedRole == ProjectRole.viewer,
                      onTap: () =>
                          setState(() => selectedRole = ProjectRole.viewer),
                    ),
                    const SizedBox(width: 8),
                    RoleOption(
                      label: 'Editor',
                      isSelected: selectedRole == ProjectRole.editor,
                      onTap: () =>
                          setState(() => selectedRole = ProjectRole.editor),
                    ),
                    const SizedBox(width: 8),
                    RoleOption(
                      label: 'Admin',
                      isSelected: selectedRole == ProjectRole.admin,
                      onTap: () =>
                          setState(() => selectedRole = ProjectRole.admin),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  _getRoleDescription(selectedRole),
                  style: context.theme.typography.xs.copyWith(
                    color: colors.textMuted,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: FButton(
                        onPress: () => Navigator.pop(sheetContext),
                        style: FButtonStyle.outline(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FButton(
                        onPress: () {
                          final email = emailController.text.trim();
                          if (email.isNotEmpty) {
                            // Validate email format
                            if (!AppUtils.isValidEmail(email)) {
                              showFToast(
                                context: context,
                                icon: const Icon(FIcons.triangleAlert),
                                title: const Text(
                                  'Please enter a valid email address',
                                ),
                                duration: const Duration(seconds: 4),
                              );
                              return;
                            }

                            projectBloc.add(
                              .addMember(
                                projectId: projectId,
                                userId: email,
                                role: selectedRole,
                              ),
                            );
                            Navigator.pop(sheetContext);
                          }
                        },
                        child: const Text('Invite'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getRoleDescription(ProjectRole role) {
    return switch (role) {
      .viewer => 'Can view project and tasks',
      .editor => 'Can view and edit tasks',
      .admin => 'Can manage project and members',
    };
  }

  void _showDeleteConfirmation(BuildContext context) {
    final colors = context.appColors;

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: colors.backgroundCard,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
        child: Padding(
          padding: const .all(24),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.errorRed.withValues(alpha: 0.2),
                  shape: .circle,
                ),
                child: const Icon(
                  FIcons.trash2,
                  color: AppTheme.errorRed,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Delete Project',
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to delete this project? All tasks will be deleted. This action cannot be undone.',
                textAlign: .center,
                style: context.theme.typography.sm.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: FButton(
                      onPress: () => Navigator.pop(dialogContext),
                      style: FButtonStyle.outline(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FTappable(
                      onPress: () {
                        context.read<ProjectBloc>().add(
                          .deleteProject(projectId),
                        );
                        Navigator.pop(dialogContext);
                      },
                      child: Container(
                        padding: const .symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.errorRed,
                          borderRadius: .circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Delete',
                            style: context.theme.typography.sm.copyWith(
                              fontWeight: .w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
