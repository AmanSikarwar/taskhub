import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_bottom_sheets.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../bloc/project_bloc.dart';
import '../widgets/create_project_fab.dart';
import '../widgets/projects_list.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProjectBloc>()..add(const ProjectEvent.loadProjects()),
      child: const ProjectsView(),
    );
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);
    final maxWidth = isDesktop ? 800.0 : double.infinity;

    return FScaffold(
      childPad: false,
      child: Container(
        color: colors.background,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Stack(
                children: [
                  Column(
                    children: [
                      AppPageHeader(
                        title: 'Projects',
                        actions: [
                          AppHeaderAction(
                            icon: FIcons.bell,
                            onTap: () => const NotificationsRoute().go(context),
                          ),
                        ],
                      ),
                      Expanded(
                        child: BlocConsumer<ProjectBloc, ProjectState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              projectCreated: (project) {
                                showFToast(
                                  context: context,
                                  icon: const Icon(FIcons.check),
                                  title: Text(
                                    'Project "${project.title}" created!',
                                  ),
                                  duration: const Duration(seconds: 3),
                                );
                                context.read<ProjectBloc>().add(
                                  const ProjectEvent.loadProjects(),
                                );
                              },
                              error: (failure) {
                                showFToast(
                                  context: context,
                                  icon: const Icon(FIcons.triangleAlert),
                                  title: Text(
                                    ErrorMessages.fromProjectFailure(failure),
                                  ),
                                  duration: const Duration(seconds: 4),
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.when(
                              initial: () => const SizedBox.shrink(),
                              loading: () => Center(
                                child: CircularProgressIndicator(
                                  color: AppTheme.primaryYellow,
                                  backgroundColor: colors.backgroundSecondary,
                                ),
                              ),
                              projectsLoaded: (projects) =>
                                  ProjectsList(projects: projects),
                              projectLoaded: (_) => const SizedBox.shrink(),
                              membersLoaded: (_) => const SizedBox.shrink(),
                              projectCreated: (_) => const SizedBox.shrink(),
                              projectUpdated: (_) => const SizedBox.shrink(),
                              projectDeleted: (_) => const SizedBox.shrink(),
                              memberAdded: (_) => const SizedBox.shrink(),
                              memberUpdated: (_) => const SizedBox.shrink(),
                              memberRemoved: (_) => const SizedBox.shrink(),
                              projectLeft: (_) => const SizedBox.shrink(),
                              error: (failure) => ErrorState(
                                message: ErrorMessages.fromProjectFailure(
                                  failure,
                                ),
                                onRetry: () {
                                  context.read<ProjectBloc>().add(
                                    const ProjectEvent.loadProjects(),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 16,
                    bottom: 100,
                    child: CreateProjectFab(
                      onTap: () => _showCreateProjectSheet(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCreateProjectSheet(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showAppBottomSheet(
      context: context,
      builder: (sheetContext) => FormBottomSheet(
        title: 'Create Project',
        fields: [
          FTextField(
            control: FTextFieldControl.managed(controller: titleController),
            hint: 'Enter project title',
            label: const Text('Title'),
          ),
          const SizedBox(height: 16),
          FTextField(
            control: FTextFieldControl.managed(
              controller: descriptionController,
            ),
            hint: 'Enter project description',
            label: const Text('Description (optional)'),
            maxLines: 3,
          ),
        ],
        onSave: () {
          if (titleController.text.trim().isNotEmpty) {
            context.read<ProjectBloc>().add(
              ProjectEvent.createProject(
                title: titleController.text.trim(),
                description: descriptionController.text.trim().isEmpty
                    ? null
                    : descriptionController.text.trim(),
              ),
            );
            Navigator.pop(sheetContext);
          }
        },
        canSave: true,
      ),
    );
  }
}
