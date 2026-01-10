import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../projects/presentation/bloc/project_bloc.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/recent_project_section.dart';
import '../widgets/stats_overview.dart';
import '../widgets/today_tasks_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProjectBloc>()
            ..add(const .loadProjects())
            ..add(const .watchProjects()),
        ),
        BlocProvider(
          create: (_) => getIt<TaskBloc>()
            ..add(const .loadMyTasks())
            ..add(const .watchMyTasks()),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _refreshData() {
    context.read<ProjectBloc>().add(const ProjectEvent.loadProjects());
    context.read<TaskBloc>().add(const TaskEvent.loadMyTasks());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);

    return FScaffold(
      childPad: false,
      child: Container(
        color: colors.background,
        child: SafeArea(
          bottom: false,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final user = authState.whenOrNull(authenticated: (user) => user);

              return RefreshIndicator(
                onRefresh: () async => _refreshData(),
                color: AppTheme.primaryYellow,
                backgroundColor: colors.backgroundCard,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: .symmetric(
                        horizontal: isDesktop ? 32 : 20,
                        vertical: 24,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          DashboardHeader(user: user),
                          const SizedBox(height: 32),
                          const StatsOverview(),
                          const SizedBox(height: 32),
                          const TodayTasksSection(),
                          const SizedBox(height: 32),
                          const RecentProjectsSection(),
                        ]),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
