import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_bottom_sheets.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';
import '../widgets/tab_section.dart';
import '../widgets/tasks_listview.dart';

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TaskBloc>()
        ..add(const .loadMyTasks())
        ..add(const .watchMyTasks()),
      child: const MyTasksView(),
    );
  }
}

class MyTasksView extends StatefulWidget {
  const MyTasksView({super.key});

  @override
  State<MyTasksView> createState() => _MyTasksViewState();
}

class _MyTasksViewState extends State<MyTasksView> {
  int _selectedTabIndex = 0;
  TaskPriority? _filterPriority;

  TaskStatus? get _filterStatus => switch (_selectedTabIndex) {
    1 => .todo,
    2 => .inProgress,
    3 => .completed,
    _ => null,
  };

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
              child: Column(
                children: [
                  AppPageHeader(
                    title: 'My Tasks',
                    showBackButton: true,
                    actions: [
                      AppHeaderAction(
                        icon: FIcons.listFilter,
                        onTap: () => _showFilterSheet(context),
                      ),
                    ],
                  ),
                  TabSection(
                    selectedIndex: _selectedTabIndex,
                    onTabChanged: (index) {
                      setState(() => _selectedTabIndex = index);
                    },
                  ),
                  Expanded(
                    child: BlocConsumer<TaskBloc, TaskState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          taskUpdated: (task) {
                            showFToast(
                              context: context,
                              icon: const Icon(FIcons.check),
                              title: Text('Task "${task.title}" updated'),
                              duration: const Duration(seconds: 3),
                            );
                            context.read<TaskBloc>().add(const .loadMyTasks());
                          },
                          taskDeleted: (_) {
                            showFToast(
                              context: context,
                              icon: const Icon(FIcons.check),
                              title: const Text('Task deleted'),
                              duration: const Duration(seconds: 3),
                            );
                            context.read<TaskBloc>().add(const .loadMyTasks());
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
                          tasksLoaded: (tasks) {
                            var filteredTasks = tasks;

                            if (_filterStatus != null) {
                              filteredTasks = filteredTasks
                                  .where((t) => t.status == _filterStatus)
                                  .toList();
                            }

                            if (_filterPriority != null) {
                              filteredTasks = filteredTasks
                                  .where((t) => t.priority == _filterPriority)
                                  .toList();
                            }

                            return TasksListView(tasks: filteredTasks);
                          },
                          taskLoaded: (_) => const SizedBox.shrink(),
                          taskCreated: (_) => const SizedBox.shrink(),
                          taskUpdated: (_) => const SizedBox.shrink(),
                          taskDeleted: (_) => const SizedBox.shrink(),
                          error: (failure) => ErrorState(
                            onRetry: () {
                              context.read<TaskBloc>().add(
                                const .loadMyTasks(),
                              );
                            },
                            message: ErrorMessages.fromTaskFailure(failure),
                          ),
                        );
                      },
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

  void _showFilterSheet(BuildContext context) {
    showActionMenuBottomSheet(
      context: context,
      title: 'Filter by Priority',
      options: [
        AppBottomSheetOption(
          icon: FIcons.list,
          label: 'All priorities',
          onTap: () {
            setState(() => _filterPriority = null);
            Navigator.pop(context);
          },
        ),
        AppBottomSheetOption(
          icon: FIcons.triangleAlert,
          label: 'Urgent',
          onTap: () {
            setState(() => _filterPriority = TaskPriority.urgent);
            Navigator.pop(context);
          },
        ),
        AppBottomSheetOption(
          icon: FIcons.arrowUp,
          label: 'High',
          onTap: () {
            setState(() => _filterPriority = TaskPriority.high);
            Navigator.pop(context);
          },
        ),
        AppBottomSheetOption(
          icon: FIcons.minus,
          label: 'Medium',
          onTap: () {
            setState(() => _filterPriority = TaskPriority.medium);
            Navigator.pop(context);
          },
        ),
        AppBottomSheetOption(
          icon: FIcons.arrowDown,
          label: 'Low',
          onTap: () {
            setState(() => _filterPriority = TaskPriority.low);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
