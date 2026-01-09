import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../home/presentation/widgets/stat_card.dart';
import '../../../tasks/domain/entities/task.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../domain/entities/project.dart';
import 'task_card.dart';

class ProjectContent extends StatelessWidget {
  final Project? project;
  final List<Task> tasks;
  final String projectId;
  final bool isDesktop;

  const ProjectContent({
    super.key,
    required this.project,
    required this.tasks,
    required this.projectId,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final pendingTasks = tasks.where((t) => t.status != .completed).toList();
    final completedTasks = tasks.where((t) => t.status == .completed).toList();

    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colors.backgroundCard,
                shape: .circle,
              ),
              child: Icon(
                FIcons.clipboardList,
                size: 40,
                color: colors.textMuted,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No tasks yet',
              style: context.theme.typography.lg.copyWith(
                fontWeight: .w600,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first task to get started',
              style: context.theme.typography.sm.copyWith(
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            FButton(
              onPress: () => _showCreateTaskDialog(context),
              prefix: const Icon(FIcons.plus, size: 18),
              child: const Text('Create Task'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TaskBloc>().add(.loadProjectTasks(projectId));
      },
      color: AppTheme.primaryYellow,
      backgroundColor: colors.backgroundCard,
      child: ListView(
        padding: .symmetric(horizontal: isDesktop ? 32 : 20, vertical: 8),
        children: [
          Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: FIcons.clipboardList,
                  label: 'Total',
                  value: tasks.length.toString(),
                  color: AppTheme.infoBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: FIcons.clock,
                  label: 'Pending',
                  value: pendingTasks.length.toString(),
                  color: AppTheme.warningOrange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: FIcons.circleCheck,
                  label: 'Done',
                  value: completedTasks.length.toString(),
                  color: AppTheme.successGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (pendingTasks.isNotEmpty) ...[
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Pending Tasks',
                  style: context.theme.typography.base.copyWith(
                    fontWeight: .w600,
                    color: colors.textPrimary,
                  ),
                ),
                FTappable(
                  onPress: () => _showCreateTaskDialog(context),
                  child: Container(
                    padding: const .symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryYellow.withValues(alpha: 0.2),
                      borderRadius: .circular(8),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        const Icon(
                          FIcons.plus,
                          size: 14,
                          color: AppTheme.primaryYellow,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Add Task',
                          style: context.theme.typography.xs.copyWith(
                            color: AppTheme.primaryYellow,
                            fontWeight: .w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...pendingTasks.map(
              (task) => Padding(
                padding: const .only(bottom: 8),
                child: TaskCard(task: task, projectId: projectId),
              ),
            ),
            const SizedBox(height: 16),
          ],

          if (completedTasks.isNotEmpty) ...[
            Text(
              'Completed',
              style: context.theme.typography.base.copyWith(
                fontWeight: .w600,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            ...completedTasks.map(
              (task) => Padding(
                padding: const .only(bottom: 8),
                child: TaskCard(task: task, projectId: projectId),
              ),
            ),
          ],

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  void _showCreateTaskDialog(BuildContext context) {
    final colors = context.appColors;
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    TaskPriority priority = .medium;
    DateTime? dueDate;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (builderContext, setState) => Dialog(
          backgroundColor: colors.backgroundCard,
          shape: RoundedRectangleBorder(borderRadius: .circular(20)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const .all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Create Task',
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
                    'Task Title',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FTextField(
                    control: FTextFieldControl.managed(
                      controller: titleController,
                    ),
                    hint: 'What needs to be done?',
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
                    hint: 'Add details',
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Priority',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: TaskPriority.values.map((p) {
                      final isSelected = p == priority;
                      return Expanded(
                        child: Padding(
                          padding: const .only(right: 8),
                          child: FTappable(
                            onPress: () => setState(() => priority = p),
                            child: Container(
                              padding: const .symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppTheme.primaryYellow
                                    : colors.backgroundSecondary,
                                borderRadius: .circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  p.name[0].toUpperCase() + p.name.substring(1),
                                  style: context.theme.typography.xs.copyWith(
                                    color: isSelected
                                        ? AppTheme.backgroundDark
                                        : colors.textSecondary,
                                    fontWeight: isSelected ? .bold : .normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  FTappable(
                    onPress: () async {
                      final date = await showDatePicker(
                        context: builderContext,
                        initialDate: dueDate ?? DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 365),
                        ),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365 * 5),
                        ),
                      );
                      if (date != null) {
                        setState(() => dueDate = date);
                      }
                    },
                    child: Container(
                      padding: const .all(16),
                      decoration: BoxDecoration(
                        color: colors.backgroundSecondary,
                        borderRadius: .circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FIcons.calendar,
                            color: colors.textSecondary,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              dueDate == null
                                  ? 'Add due date'
                                  : '${dueDate!.day}/${dueDate!.month}/${dueDate!.year}',
                              style: context.theme.typography.sm.copyWith(
                                color: dueDate == null
                                    ? colors.textSecondary
                                    : colors.textPrimary,
                              ),
                            ),
                          ),
                          if (dueDate != null)
                            FTappable(
                              onPress: () => setState(() => dueDate = null),
                              child: Icon(
                                FIcons.x,
                                color: colors.textSecondary,
                                size: 18,
                              ),
                            ),
                        ],
                      ),
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
                        child: FButton(
                          onPress: () {
                            if (titleController.text.trim().isNotEmpty) {
                              context.read<TaskBloc>().add(
                                .createTask(
                                  projectId: projectId,
                                  title: titleController.text.trim(),
                                  description:
                                      descriptionController.text.trim().isEmpty
                                      ? null
                                      : descriptionController.text.trim(),
                                  priority: priority,
                                  dueDate: dueDate,
                                ),
                              );
                              Navigator.pop(dialogContext);
                            }
                          },
                          child: const Text('Create'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
