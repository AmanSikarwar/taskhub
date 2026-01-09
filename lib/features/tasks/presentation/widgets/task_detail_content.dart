import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../notifications/presentation/widgets/bottomsheet_options.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';
import 'detail_item.dart';
import 'priority_badge.dart';
import 'status_chip.dart';
import 'status_option.dart';

class TaskDetailContent extends StatelessWidget {
  final Task task;

  const TaskDetailContent({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final projectColor = _parseColor(task.projectColorCode ?? '#FFC107');

    return Column(
      children: [
        Padding(
          padding: const .all(16),
          child: Row(
            children: [
              FTappable(
                onPress: () => Navigator.pop(context),
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
              Text(
                'Task Details',
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const Spacer(),
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
                    color: colors.textPrimary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const .symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                if (task.projectTitle != null)
                  Container(
                    padding: const .symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: projectColor.withValues(alpha: 0.2),
                      borderRadius: .circular(20),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: projectColor,
                            shape: .circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          task.projectTitle!,
                          style: context.theme.typography.xs.copyWith(
                            color: projectColor,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: .start,
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: context.theme.typography.xl.copyWith(
                          fontWeight: .bold,
                          color: colors.textPrimary,
                          decoration: task.status == .completed
                              ? .lineThrough
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    StatusChip(status: task.status),
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
                  child: Column(
                    children: [
                      DetailItem(
                        icon: FIcons.flag,
                        label: 'Priority',
                        child: PriorityBadge(priority: task.priority),
                      ),
                      if (task.dueDate != null) ...[
                        const SizedBox(height: 16),
                        DetailItem(
                          icon: FIcons.calendar,
                          label: 'Due Date',
                          value: _formatDate(task.dueDate!),
                          valueColor: _getDueDateColor(task.dueDate!),
                        ),
                      ],
                      if (task.assigneeName != null) ...[
                        const SizedBox(height: 16),
                        DetailItem(
                          icon: FIcons.user,
                          label: 'Assignee',
                          value: task.assigneeName!,
                        ),
                      ],
                      if (task.isRecurring) ...[
                        const SizedBox(height: 16),
                        DetailItem(
                          icon: FIcons.repeat,
                          label: 'Recurring',
                          value: task.recurrenceRule ?? 'Yes',
                        ),
                      ],
                      const SizedBox(height: 16),
                      DetailItem(
                        icon: FIcons.clock,
                        label: 'Created',
                        value: _formatDate(task.createdAt),
                      ),
                    ],
                  ),
                ),
                if (task.description != null &&
                    task.description!.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text(
                    'Description',
                    style: context.theme.typography.base.copyWith(
                      fontWeight: .w600,
                      color: colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const .all(16),
                    decoration: BoxDecoration(
                      color: colors.backgroundCard,
                      borderRadius: .circular(12),
                      border: .all(color: colors.border),
                    ),
                    child: Text(
                      task.description!,
                      style: context.theme.typography.sm.copyWith(
                        color: colors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        Padding(
          padding: const .all(20),
          child: SizedBox(
            width: double.infinity,
            child: task.status == .completed
                ? FButton(
                    onPress: () {
                      context.read<TaskBloc>().add(.reopenTask(task.id));
                    },
                    style: FButtonStyle.outline(),
                    prefix: const Icon(FIcons.rotateCcw, size: 18),
                    child: const Text('Reopen Task'),
                  )
                : FButton(
                    onPress: () {
                      context.read<TaskBloc>().add(.completeTask(task.id));
                    },
                    prefix: const Icon(FIcons.check, size: 18),
                    child: const Text('Mark as Complete'),
                  ),
          ),
        ),
      ],
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
                label: 'Edit Task',
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showEditTaskDialog(context);
                },
              ),
              BottomSheetOption(
                icon: FIcons.trash2,
                label: 'Delete Task',
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
                'Delete Task',
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to delete this task? This action cannot be undone.',
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
                        context.read<TaskBloc>().add(.deleteTask(task.id));
                        Navigator.pop(dialogContext);
                        Navigator.pop(context);
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

  void _showEditTaskDialog(BuildContext context) {
    final colors = context.appColors;
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);
    TaskPriority priority = task.priority;
    TaskStatus status = task.status;
    DateTime? dueDate = task.dueDate;

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
                        'Edit Task',
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
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Status',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      StatusOption(
                        label: 'To Do',
                        isSelected: status == TaskStatus.todo,
                        color: Colors.grey,
                        onTap: () => setState(() => status = TaskStatus.todo),
                      ),
                      StatusOption(
                        label: 'In Progress',
                        isSelected: status == TaskStatus.inProgress,
                        color: AppTheme.infoBlue,
                        onTap: () =>
                            setState(() => status = TaskStatus.inProgress),
                      ),
                      StatusOption(
                        label: 'Completed',
                        isSelected: status == TaskStatus.completed,
                        color: AppTheme.successGreen,
                        onTap: () =>
                            setState(() => status = TaskStatus.completed),
                      ),
                    ],
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
                                  : _formatDate(dueDate!),
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
                                TaskEvent.updateTask(
                                  taskId: task.id,
                                  title: titleController.text.trim(),
                                  description:
                                      descriptionController.text.trim().isEmpty
                                      ? null
                                      : descriptionController.text.trim(),
                                  priority: priority,
                                  status: status,
                                  dueDate: dueDate,
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
        ),
      ),
    );
  }

  Color _parseColor(String colorCode) {
    try {
      return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppTheme.primaryYellow;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Color _getDueDateColor(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);

    if (due.isBefore(today)) return AppTheme.errorRed;
    if (due == today) return AppTheme.warningOrange;
    return AppTheme.successGreen;
  }
}
