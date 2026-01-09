import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/entities/project.dart';
import '../bloc/project_bloc.dart';
import 'member_card.dart';

class MembersSheet extends StatelessWidget {
  final String projectId;
  final bool isOwner;
  final Project? project;

  const MembersSheet({
    super.key,
    required this.projectId,
    required this.isOwner,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final currentUserId = context.read<AuthBloc>().state.whenOrNull(
      authenticated: (user) => user.id,
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, scrollController) => BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          final members =
              state.whenOrNull(membersLoaded: (members) => members) ?? [];

          return Padding(
            padding: const .all(20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const .only(bottom: 20),
                    decoration: BoxDecoration(
                      color: colors.border,
                      borderRadius: .circular(2),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Team Members',
                          style: context.theme.typography.lg.copyWith(
                            fontWeight: .bold,
                            color: colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${members.length} member${members.length == 1 ? '' : 's'}',
                          style: context.theme.typography.sm.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    if (isOwner)
                      FTappable(
                        onPress: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const .symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryYellow.withValues(
                              alpha: 0.2,
                            ),
                            borderRadius: .circular(10),
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              const Icon(
                                FIcons.userPlus,
                                size: 16,
                                color: AppTheme.primaryYellow,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Invite',
                                style: context.theme.typography.sm.copyWith(
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
                const SizedBox(height: 20),
                Expanded(
                  child: members.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: .min,
                            children: [
                              Icon(
                                FIcons.users,
                                size: 48,
                                color: colors.textMuted,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'No members found',
                                style: context.theme.typography.sm.copyWith(
                                  color: colors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          controller: scrollController,
                          itemCount: members.length,
                          separatorBuilder: (_, _) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final member = members[index];
                            final isOwnerMember =
                                project?.ownerId == member.userId;
                            return MemberCard(
                              member: member,
                              isOwner: isOwner,
                              isOwnerMember: isOwnerMember,
                              isCurrentUser: member.userId == currentUserId,
                              projectId: projectId,
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
