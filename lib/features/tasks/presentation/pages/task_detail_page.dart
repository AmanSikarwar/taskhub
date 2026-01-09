import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';

import '../bloc/task_bloc.dart';
import '../widgets/task_detail_content.dart';

class TaskDetailPage extends StatelessWidget {
  final String taskId;

  const TaskDetailPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TaskBloc>()..add(.loadTask(taskId)),
      child: TaskDetailView(taskId: taskId),
    );
  }
}

class TaskDetailView extends StatelessWidget {
  final String taskId;

  const TaskDetailView({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);
    final maxWidth = isDesktop ? 700.0 : double.infinity;

    return FScaffold(
      child: Container(
        color: colors.background,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryYellow,
                        backgroundColor: colors.backgroundSecondary,
                      ),
                    ),
                    taskLoaded: (task) => TaskDetailContent(task: task),
                    taskCreated: (task) => TaskDetailContent(task: task),
                    taskUpdated: (task) => TaskDetailContent(task: task),
                    taskDeleted: (_) =>
                        _buildMessage(context, 'Task deleted', FIcons.trash2),
                    error: (failure) => _buildError(context, failure),
                    orElse: () => Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryYellow,
                        backgroundColor: colors.backgroundSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context, String message, IconData icon) {
    final colors = context.appColors;

    return Column(
      children: [
        _buildHeader(context),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: .min,
              children: [
                Icon(icon, size: 48, color: colors.textMuted),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: context.theme.typography.base.copyWith(
                    color: colors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, dynamic failure) {
    final colors = context.appColors;
    final message = failure.when(
      serverError: (String msg) => msg,
      networkError: () => 'Network error',
      notFound: () => 'Task not found',
      unauthorized: () => 'Unauthorized',
      forbidden: () => 'Forbidden',
      invalidTitle: () => 'Invalid title',
      invalidRecurrenceRule: () => 'Invalid recurrence rule',
      projectNotFound: () => 'Project not found',
      assigneeNotFound: () => 'Assignee not found',
      unknown: (String msg) => msg,
    );

    return Column(
      children: [
        _buildHeader(context),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: .min,
              children: [
                const Icon(
                  FIcons.circleAlert,
                  size: 48,
                  color: AppTheme.errorRed,
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: context.theme.typography.base.copyWith(
                    color: colors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = context.appColors;

    return Padding(
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
        ],
      ),
    );
  }
}
