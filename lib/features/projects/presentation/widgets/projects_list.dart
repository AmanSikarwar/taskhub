import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_list_item.dart';
import '../../domain/entities/project.dart';
import '../bloc/project_bloc.dart';
import 'project_card.dart';

class ProjectsList extends StatelessWidget {
  final List<ProjectWithRole> projects;

  const ProjectsList({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    if (projects.isEmpty) {
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
              child: Icon(FIcons.folderOpen, size: 40, color: colors.textMuted),
            ),
            const SizedBox(height: 20),
            Text(
              'No projects yet',
              style: context.theme.typography.lg.copyWith(
                fontWeight: .w600,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first project to get started',
              style: context.theme.typography.sm.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProjectBloc>().add(const ProjectEvent.loadProjects());
      },
      color: AppTheme.primaryYellow,
      backgroundColor: colors.backgroundCard,
      child: ListView.builder(
        padding: const .symmetric(horizontal: 16, vertical: 20),
        itemCount: projects.length + 1, // +1 for bottom spacing
        itemBuilder: (context, index) {
          if (index == projects.length) {
            return const SizedBox(height: 100);
          }

          final projectWithRole = projects[index];
          return AnimatedListItem(
            index: index,
            child: Padding(
              padding: const .only(bottom: 12),
              child: ProjectCard(projectWithRole: projectWithRole),
            ),
          );
        },
      ),
    );
  }
}
