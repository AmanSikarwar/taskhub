import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../theme/app_theme.dart';

/// Shows a bottom sheet from the bottom
///
/// This wrapper properly handles keyboard insets for form inputs
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isDismissible = true,
  bool enableDrag = true,
  bool isScrollControlled = true,
}) {
  final colors = context.appColors;

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: colors.backgroundCard,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(20)),
    ),
    builder: builder,
  );
}

/// A standard bottom sheet option item
///
/// Used in action menus and option lists
class AppBottomSheetOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const AppBottomSheetOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textColor = isDestructive ? AppTheme.errorRed : colors.textPrimary;
    final iconColor = isDestructive ? AppTheme.errorRed : colors.textSecondary;

    return FTappable(
      onPress: onTap,
      child: Padding(
        padding: const .symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: iconColor),
            const SizedBox(width: 16),
            Text(
              label,
              style: context.theme.typography.base.copyWith(
                color: textColor,
                fontWeight: .w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows a confirmation bottom sheet with a destructive action
///
/// Typical use case: delete confirmations, sign out, etc.
Future<bool?> showConfirmationBottomSheet({
  required BuildContext context,
  required String title,
  required String message,
  required String confirmLabel,
  String cancelLabel = 'Cancel',
  IconData? icon,
  VoidCallback? onConfirm,
}) {
  final colors = context.appColors;

  return showAppBottomSheet<bool>(
    context: context,
    isScrollControlled: false,
    builder: (sheetContext) => SafeArea(
      child: Padding(
        padding: const .all(24),
        child: Column(
          mainAxisSize: .min,
          children: [
            if (icon != null) ...[
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.errorRed.withValues(alpha: 0.2),
                  shape: .circle,
                ),
                child: Icon(icon, color: AppTheme.errorRed, size: 32),
              ),
              const SizedBox(height: 20),
            ],
            Text(
              title,
              style: context.theme.typography.lg.copyWith(
                fontWeight: .bold,
                color: colors.textPrimary,
              ),
              textAlign: .center,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: context.theme.typography.sm.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: .center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FButton(
                    onPress: () => Navigator.pop(sheetContext, false),
                    style: FButtonStyle.outline(),
                    child: Text(cancelLabel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FTappable(
                    onPress: () {
                      onConfirm?.call();
                      Navigator.pop(sheetContext, true);
                    },
                    child: Container(
                      padding: const .symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppTheme.errorRed,
                        borderRadius: .circular(12),
                      ),
                      child: Center(
                        child: Text(
                          confirmLabel,
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

/// A bottom sheet handle/drag indicator
class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      width: 40,
      height: 4,
      margin: const .only(bottom: 16),
      decoration: BoxDecoration(
        color: colors.border,
        borderRadius: .circular(2),
      ),
    );
  }
}

/// Shows an action menu bottom sheet
///
/// Use this for options like edit, delete, share, etc.
Future<T?> showActionMenuBottomSheet<T>({
  required BuildContext context,
  required List<AppBottomSheetOption> options,
  String? title,
}) {
  final colors = context.appColors;

  return showAppBottomSheet<T>(
    context: context,
    isScrollControlled: false,
    builder: (sheetContext) => SafeArea(
      child: Padding(
        padding: const .symmetric(vertical: 8),
        child: Column(
          mainAxisSize: .min,
          children: [
            const BottomSheetHandle(),
            if (title != null) ...[
              Text(
                title,
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
            ],
            ...options,
            const SizedBox(height: 8),
          ],
        ),
      ),
    ),
  );
}

/// A form bottom sheet with a title and action buttons
///
/// Use this for create/edit forms
class FormBottomSheet extends StatelessWidget {
  final String title;
  final List<Widget> fields;
  final VoidCallback onSave;
  final VoidCallback? onCancel;
  final String saveLabel;
  final String cancelLabel;
  final bool canSave;

  const FormBottomSheet({
    super.key,
    required this.title,
    required this.fields,
    required this.onSave,
    this.onCancel,
    this.saveLabel = 'Save',
    this.cancelLabel = 'Cancel',
    this.canSave = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundCard,
        borderRadius: const .vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: .only(
          left: 24,
          right: 24,
          top: 12,
          bottom: bottomPadding > 0 ? bottomPadding : 24,
        ),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const .only(bottom: 16),
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: .circular(2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.theme.typography.xl.copyWith(
                    fontWeight: .bold,
                    color: colors.textPrimary,
                  ),
                ),
                FTappable(
                  onPress: () {
                    if (onCancel != null) {
                      onCancel!();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Icon(FIcons.x, color: colors.textSecondary, size: 24),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...fields,
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FButton(
                    onPress: () {
                      if (onCancel != null) {
                        onCancel!();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    style: FButtonStyle.outline(),
                    child: Text(cancelLabel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FButton(
                    onPress: canSave ? onSave : null,
                    child: Text(saveLabel),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
