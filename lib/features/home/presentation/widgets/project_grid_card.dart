import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../projects/domain/entities/project.dart';

class ProjectGridCard extends StatelessWidget {
  final ProjectWithRole project;
  const ProjectGridCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final projectColor = _parseColor(project.project.colorCode);
    final progress = project.taskCount > 0
        ? project.completedTaskCount / project.taskCount
        : 0.0;

    return FTappable(
      onPress: () =>
          ProjectDetailRoute(projectId: project.project.id).push(context),
      child: Container(
        padding: const .all(16),
        decoration: BoxDecoration(
          color: colors.backgroundCard,
          borderRadius: .circular(16),
          border: .all(color: colors.border),
        ),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: projectColor.withValues(alpha: 0.2),
                    borderRadius: .circular(10),
                  ),
                  child: Icon(FIcons.folder, color: projectColor, size: 20),
                ),
                if (project.role == .admin)
                  const Icon(
                    FIcons.shield,
                    size: 14,
                    color: AppTheme.primaryYellow,
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  project.project.title,
                  style: context.theme.typography.base.copyWith(
                    fontWeight: .bold,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 4),
              ],
            ),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: colors.backgroundSecondary,
              color: projectColor,
              borderRadius: .circular(2),
              minHeight: 4,
            ),
          ],
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
}
