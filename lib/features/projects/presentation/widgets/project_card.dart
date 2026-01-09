import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../domain/entities/project.dart';

class ProjectCard extends StatelessWidget {
  final ProjectWithRole projectWithRole;

  const ProjectCard({super.key, required this.projectWithRole});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final project = projectWithRole.project;
    final color = AppUtils.parseColor(project.colorCode);
    final progress = projectWithRole.taskCount > 0
        ? projectWithRole.completedTaskCount / projectWithRole.taskCount
        : 0.0;

    return AppCard(
      onTap: () => ProjectDetailRoute(projectId: project.id).push(context),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(color: color, shape: .circle),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  project.title,
                  style: context.theme.typography.base.copyWith(
                    fontWeight: .w600,
                    color: colors.textPrimary,
                  ),
                ),
              ),
              RoleBadge(role: projectWithRole.role.name.toUpperCase()),
            ],
          ),
          if (project.description != null) ...[
            const SizedBox(height: 8),
            Text(
              project.description!,
              maxLines: 2,
              overflow: .ellipsis,
              style: context.theme.typography.sm.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: .circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: color.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${projectWithRole.completedTaskCount}/${projectWithRole.taskCount}',
                style: context.theme.typography.xs.copyWith(
                  color: colors.textSecondary,
                  fontWeight: .w500,
                ),
              ),
            ],
          ),
          if (project.dueDate != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(FIcons.calendar, size: 14, color: colors.textSecondary),
                const SizedBox(width: 6),
                Text(
                  AppUtils.formatDueDate(project.dueDate!),
                  style: context.theme.typography.xs.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
