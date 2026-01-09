import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../domain/entities/project_failure.dart';
import '../bloc/project_bloc.dart';
import '../widgets/project_content.dart';
import '../widgets/project_header.dart';

class ProjectDetailPage extends StatelessWidget {
  final String projectId;

  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProjectBloc>()
            ..add(.loadProject(projectId))
            ..add(.loadProjectMembers(projectId)),
        ),
        BlocProvider(
          create: (_) => getIt<TaskBloc>()..add(.loadProjectTasks(projectId)),
        ),
      ],
      child: ProjectDetailView(projectId: projectId),
    );
  }
}

class ProjectDetailView extends StatelessWidget {
  final String projectId;

  const ProjectDetailView({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);

    return MultiBlocListener(
      listeners: [
        BlocListener<ProjectBloc, ProjectState>(
          listener: (context, state) {
            state.whenOrNull(
              memberAdded: (member) {
                showFToast(
                  context: context,
                  icon: const Icon(FIcons.check),
                  title: Text(
                    '${member.displayName ?? member.email ?? 'Member'} added to project',
                  ),
                  duration: const Duration(seconds: 3),
                );
                context.read<ProjectBloc>().add(.loadProjectMembers(projectId));
              },
              memberUpdated: (member) {
                showFToast(
                  context: context,
                  icon: const Icon(FIcons.check),
                  title: Text('${member.displayName ?? 'Member'} role updated'),
                  duration: const Duration(seconds: 3),
                );
                context.read<ProjectBloc>().add(.loadProjectMembers(projectId));
              },
              memberRemoved: (_) {
                showFToast(
                  context: context,
                  icon: const Icon(FIcons.check),
                  title: const Text('Member removed from project'),
                  duration: const Duration(seconds: 3),
                );
                context.read<ProjectBloc>().add(.loadProjectMembers(projectId));
              },
              projectDeleted: (_) {
                showFToast(
                  context: context,
                  icon: const Icon(FIcons.check),
                  title: const Text('Project deleted'),
                  duration: const Duration(seconds: 3),
                );
                Navigator.pop(context);
              },
              projectUpdated: (project) {
                showFToast(
                  context: context,
                  icon: const Icon(FIcons.check),
                  title: Text('Project "${project.title}" updated'),
                  duration: const Duration(seconds: 3),
                );
                context.read<ProjectBloc>().add(.loadProject(projectId));
              },
              error: (ProjectFailure failure) {
                showFToast(
                  context: context,
                  icon: const Icon(FIcons.triangleAlert),
                  title: Text(ErrorMessages.fromProjectFailure(failure)),
                  duration: const Duration(seconds: 4),
                );
              },
            );
          },
        ),
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.whenOrNull(
              taskCreated: (task) {
                showFToast(
                  context: context,
                  icon: const Icon(FIcons.check),
                  title: Text('Task "${task.title}" created'),
                  duration: const Duration(seconds: 3),
                );
                context.read<TaskBloc>().add(.loadProjectTasks(projectId));
              },
              taskUpdated: (task) {
                context.read<TaskBloc>().add(.loadProjectTasks(projectId));
              },
              taskDeleted: (_) {
                context.read<TaskBloc>().add(.loadProjectTasks(projectId));
              },
            );
          },
        ),
      ],
      child: FScaffold(
        childPad: false,
        child: Container(
          color: colors.background,
          child: SafeArea(
            child: BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, projectState) {
                final project = projectState.whenOrNull(
                  projectLoaded: (project) => project,
                );

                return Column(
                  children: [
                    ProjectHeader(project: project, projectId: projectId),
                    Expanded(
                      child: BlocBuilder<TaskBloc, TaskState>(
                        builder: (context, taskState) {
                          return taskState.maybeWhen(
                            loading: () => Center(
                              child: CircularProgressIndicator(
                                color: AppTheme.primaryYellow,
                                backgroundColor: colors.backgroundSecondary,
                              ),
                            ),
                            tasksLoaded: (tasks) => ProjectContent(
                              project: project,
                              tasks: tasks,
                              projectId: projectId,
                              isDesktop: isDesktop,
                            ),
                            error: (failure) => ErrorState(
                              message: ErrorMessages.fromTaskFailure(failure),
                              onRetry: () {
                                context.read<TaskBloc>().add(
                                  .loadProjectTasks(projectId),
                                );
                              },
                            ),
                            orElse: () => const SizedBox.shrink(),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
