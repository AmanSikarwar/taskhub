import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../notifications/presentation/widgets/bottomsheet_options.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_member.dart';
import '../bloc/project_bloc.dart';

class MemberCard extends StatelessWidget {
  final ProjectMember member;
  final bool isOwner;
  final bool isOwnerMember;
  final bool isCurrentUser;
  final String projectId;

  const MemberCard({
    super.key,
    required this.member,
    required this.isOwner,
    required this.isOwnerMember,
    required this.isCurrentUser,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final canManage = isOwner && !isCurrentUser && !isOwnerMember;

    return Container(
      padding: const .all(14),
      decoration: BoxDecoration(
        color: colors.backgroundCard,
        borderRadius: .circular(12),
        border: .all(color: colors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: .circle,
              color: AppTheme.primaryYellow.withValues(alpha: 0.2),
            ),
            child: member.avatarUrl != null
                ? ClipOval(
                    child: Image.network(
                      member.avatarUrl!,
                      fit: .cover,
                      errorBuilder: (_, _, _) => Center(
                        child: Text(
                          (member.displayName ?? member.email ?? 'U')[0]
                              .toUpperCase(),
                          style: context.theme.typography.base.copyWith(
                            fontWeight: .bold,
                            color: AppTheme.primaryYellow,
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      (member.displayName ?? member.email ?? 'U')[0]
                          .toUpperCase(),
                      style: context.theme.typography.base.copyWith(
                        fontWeight: .bold,
                        color: AppTheme.primaryYellow,
                      ),
                    ),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        member.displayName ?? member.email ?? 'Unknown',
                        style: context.theme.typography.sm.copyWith(
                          fontWeight: .w500,
                          color: colors.textPrimary,
                        ),
                        overflow: .ellipsis,
                      ),
                    ),
                    if (isCurrentUser) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const .symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow.withValues(alpha: 0.2),
                          borderRadius: .circular(4),
                        ),
                        child: Text(
                          'You',
                          style: context.theme.typography.xs.copyWith(
                            color: AppTheme.primaryYellow,
                            fontWeight: .w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  _getRoleLabel(member.role, isOwnerMember),
                  style: context.theme.typography.xs.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (isOwnerMember)
            Container(
              padding: const .symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryYellow.withValues(alpha: 0.2),
                borderRadius: .circular(8),
              ),
              child: Text(
                'Owner',
                style: context.theme.typography.xs.copyWith(
                  color: AppTheme.primaryYellow,
                  fontWeight: .w600,
                ),
              ),
            )
          else if (canManage)
            FTappable(
              onPress: () => _showMemberOptions(context),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colors.backgroundSecondary,
                  borderRadius: .circular(8),
                ),
                child: Icon(
                  FIcons.ellipsisVertical,
                  size: 16,
                  color: colors.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _getRoleLabel(ProjectRole role, bool isOwnerMember) {
    if (isOwnerMember) return 'Project Owner';
    return switch (role) {
      .admin => 'Admin',
      .editor => 'Editor',
      .viewer => 'Viewer',
    };
  }

  void _showMemberOptions(BuildContext context) {
    final colors = context.appColors;

    showModalBottomSheet(
      context: context,
      backgroundColor: colors.backgroundCard,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: Radius.circular(20)),
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
                icon: FIcons.shield,
                label: 'Change Role',
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showChangeRoleDialog(context);
                },
              ),
              BottomSheetOption(
                icon: FIcons.userMinus,
                label: 'Remove Member',
                isDestructive: true,
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showRemoveConfirmation(context);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangeRoleDialog(BuildContext context) {
    final colors = context.appColors;
    ProjectRole selectedRole = member.role;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          backgroundColor: colors.backgroundCard,
          shape: RoundedRectangleBorder(borderRadius: .circular(20)),
          child: Padding(
            padding: const .all(24),
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Change Role',
                  style: context.theme.typography.lg.copyWith(
                    fontWeight: .bold,
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  member.displayName ?? member.email ?? 'Member',
                  style: context.theme.typography.sm.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 20),
                ...ProjectRole.values.map(
                  (role) => Padding(
                    padding: const .only(bottom: 8),
                    child: FTappable(
                      onPress: () => setState(() => selectedRole = role),
                      child: Container(
                        padding: const .all(14),
                        decoration: BoxDecoration(
                          color: selectedRole == role
                              ? AppTheme.primaryYellow.withValues(alpha: 0.1)
                              : colors.backgroundSecondary,
                          borderRadius: .circular(12),
                          border: selectedRole == role
                              ? .all(color: AppTheme.primaryYellow)
                              : null,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _getRoleIcon(role),
                              size: 20,
                              color: selectedRole == role
                                  ? AppTheme.primaryYellow
                                  : colors.textSecondary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    _getRoleName(role),
                                    style: context.theme.typography.sm.copyWith(
                                      fontWeight: .w500,
                                      color: selectedRole == role
                                          ? AppTheme.primaryYellow
                                          : colors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    _getRoleDescription(role),
                                    style: context.theme.typography.xs.copyWith(
                                      color: colors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (selectedRole == role)
                              const Icon(
                                FIcons.check,
                                size: 18,
                                color: AppTheme.primaryYellow,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                          context.read<ProjectBloc>().add(
                            .updateMemberRole(
                              projectId: projectId,
                              userId: member.userId,
                              role: selectedRole,
                            ),
                          );
                          Navigator.pop(dialogContext);
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
    );
  }

  IconData _getRoleIcon(ProjectRole role) {
    return switch (role) {
      .viewer => FIcons.eye,
      .editor => FIcons.pencil,
      .admin => FIcons.shield,
    };
  }

  String _getRoleName(ProjectRole role) {
    return switch (role) {
      .viewer => 'Viewer',
      .editor => 'Editor',
      .admin => 'Admin',
    };
  }

  String _getRoleDescription(ProjectRole role) {
    return switch (role) {
      .viewer => 'Can view project and tasks',
      .editor => 'Can view and edit tasks',
      .admin => 'Can manage project and members',
    };
  }

  void _showRemoveConfirmation(BuildContext context) {
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
                  FIcons.userMinus,
                  color: AppTheme.errorRed,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Remove Member',
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to remove ${member.displayName ?? member.email ?? 'this member'} from the project?',
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
                        context.read<ProjectBloc>().add(
                          .removeMember(
                            projectId: projectId,
                            userId: member.userId,
                          ),
                        );
                        Navigator.pop(dialogContext);
                      },
                      child: Container(
                        padding: const .symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.errorRed,
                          borderRadius: .circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Remove',
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
}
