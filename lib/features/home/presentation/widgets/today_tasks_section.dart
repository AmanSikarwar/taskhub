import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../tasks/domain/entities/task.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import 'empty_state_card.dart';
import 'task_card.dart';

class TodayTasksSection extends StatelessWidget {
  const TodayTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SectionHeader(
          title: "Today's Focus",
          onSeeAll: () => const MyTasksRoute().push(context),
        ),
        const SizedBox(height: 16),
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: Padding(
                  padding: .all(24),
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryYellow,
                  ),
                ),
              ),
              tasksLoaded: (tasks) {
                final now = DateTime.now();
                // Filter tasks due today or overdue
                final priorityTasks = tasks.where((t) {
                  final isPending = t.status != TaskStatus.completed;
                  if (!isPending) return false;

                  if (t.dueDate != null) {
                    final due = t.dueDate!;
                    final isToday =
                        due.year == now.year &&
                        due.month == now.month &&
                        due.day == now.day;
                    final isOverdue = due.isBefore(now) && !isToday;
                    return isToday || isOverdue;
                  }
                  // If no due date, include high priority
                  return t.priority == .high;
                }).toList();

                // Sort by due date then priority
                priorityTasks.sort((a, b) {
                  if (a.dueDate != null && b.dueDate != null) {
                    return a.dueDate!.compareTo(b.dueDate!);
                  }
                  if (a.dueDate != null) return -1;
                  if (b.dueDate != null) return 1;
                  return 0;
                });

                if (priorityTasks.isEmpty) {
                  return const EmptyStateCard(
                    message: "You're all caught up for today!",
                    icon: FIcons.partyPopper,
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: priorityTasks.length > 5
                      ? 5
                      : priorityTasks.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) =>
                      TaskCard(task: priorityTasks[index]),
                );
              },
              error: (_) => const EmptyStateCard(
                message: "Couldn't load tasks",
                icon: FIcons.wifiOff,
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
