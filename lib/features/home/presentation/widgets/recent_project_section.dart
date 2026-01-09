import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../../projects/presentation/bloc/project_bloc.dart';
import 'empty_state_card.dart';
import 'project_grid_card.dart';

class RecentProjectsSection extends StatelessWidget {
  const RecentProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SectionHeader(
          title: 'Your Projects',
          onSeeAll: () => const ProjectsRoute().go(context),
        ),
        const SizedBox(height: 16),
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return state.maybeWhen(
              projectsLoaded: (projects) {
                if (projects.isEmpty) {
                  return const EmptyStateCard(
                    message: 'No projects yet. Start one!',
                    icon: FIcons.folder,
                  );
                }
                final recentProjects = projects.take(4).toList(); // Show top 4
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: recentProjects.length,
                  itemBuilder: (context, index) =>
                      ProjectGridCard(project: recentProjects[index]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
