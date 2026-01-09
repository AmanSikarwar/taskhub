import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/animated_list_item.dart';
import '../../../../core/widgets/app_bottom_sheets.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _strikethroughController;
  late Animation<double> _strikethroughAnimation;
  bool _showCelebration = false;

  @override
  void initState() {
    super.initState();
    _strikethroughController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _strikethroughAnimation = CurvedAnimation(
      parent: _strikethroughController,
      curve: Curves.easeInOut,
    );

    if (widget.task.status == .completed) {
      _strikethroughController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(TaskTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.task.status != oldWidget.task.status) {
      if (widget.task.status == .completed) {
        _strikethroughController.forward();
      } else {
        _strikethroughController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _strikethroughController.dispose();
    super.dispose();
  }

  void _handleCheckboxChanged(bool value) {
    if (value) {
      setState(() => _showCelebration = true);
      context.read<TaskBloc>().add(TaskEvent.completeTask(widget.task.id));
    } else {
      context.read<TaskBloc>().add(TaskEvent.reopenTask(widget.task.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final projectColor = AppUtils.parseColor(
      widget.task.projectColorCode ?? '#6366F1',
    );
    final isCompleted = widget.task.status == .completed;

    return Dismissible(
      key: Key(widget.task.id),
      direction: .endToStart,
      confirmDismiss: (direction) async {
        return await showConfirmationBottomSheet(
          context: context,
          title: 'Delete Task',
          message: 'Are you sure you want to delete "${widget.task.title}"?',
          confirmLabel: 'Delete',
          icon: FIcons.trash2,
        );
      },
      onDismissed: (_) {
        context.read<TaskBloc>().add(.deleteTask(widget.task.id));
      },
      background: Container(
        alignment: .centerRight,
        padding: const .only(right: 20),
        decoration: BoxDecoration(
          color: AppTheme.errorRed,
          borderRadius: .circular(16),
        ),
        child: const Icon(FIcons.trash2, color: Colors.white),
      ),
      child: TapScaleAnimation(
        onTap: () => TaskDetailRoute(taskId: widget.task.id).push(context),
        child: Container(
          padding: const .all(16),
          decoration: BoxDecoration(
            color: colors.backgroundCard,
            borderRadius: .circular(16),
            border: .all(color: colors.border),
          ),
          child: Row(
            children: [
              SuccessCelebration(
                trigger: _showCelebration,
                onComplete: () => setState(() => _showCelebration = false),
                child: AnimatedCheckbox(
                  isChecked: isCompleted,
                  onChanged: _handleCheckboxChanged,
                  uncheckedBorderColor: colors.border,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    AnimatedBuilder(
                      animation: _strikethroughAnimation,
                      builder: (context, child) {
                        return Stack(
                          children: [
                            Text(
                              widget.task.title,
                              style: context.theme.typography.sm.copyWith(
                                fontWeight: .w600,
                                color: Color.lerp(
                                  colors.textPrimary,
                                  colors.textMuted,
                                  _strikethroughAnimation.value,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: .centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: _strikethroughAnimation.value,
                                  child: Container(
                                    height: 1.5,
                                    color: colors.textMuted,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: projectColor,
                            shape: .circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            widget.task.projectTitle ?? 'Personal',
                            maxLines: 1,
                            overflow: .ellipsis,
                            style: context.theme.typography.xs.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                        ),
                        if (widget.task.dueDate != null) ...[
                          const SizedBox(width: 8),
                          Icon(
                            FIcons.calendar,
                            size: 12,
                            color: AppUtils.getDueDateColor(
                              widget.task.dueDate!,
                              isCompleted: isCompleted,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppUtils.formatShortDueDate(widget.task.dueDate!),
                            style: context.theme.typography.xs.copyWith(
                              color: AppUtils.getDueDateColor(
                                widget.task.dueDate!,
                                isCompleted: isCompleted,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              _buildPriorityBadge(context, widget.task.priority),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriorityBadge(BuildContext context, TaskPriority priority) {
    final (color, icon) = switch (priority) {
      .urgent => (Colors.red, FIcons.triangleAlert),
      .high => (Colors.orange, FIcons.arrowUp),
      .medium => (null, null),
      .low => (null, null),
    };

    if (icon == null) return const SizedBox.shrink();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const .all(6),
      decoration: BoxDecoration(
        color: color!.withValues(alpha: 0.15),
        borderRadius: .circular(8),
      ),
      child: Icon(icon, color: color, size: 16),
    );
  }
}
