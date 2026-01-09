import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class TabSection extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const TabSection({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final tabs = ['All', 'To Do', 'In Progress', 'Done'];

    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = selectedIndex == index;
            return Padding(
              padding: const .only(right: 8),
              child: FTappable(
                onPress: () => onTabChanged(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic,
                  padding: const .symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.primaryYellow
                        : colors.backgroundCard,
                    borderRadius: .circular(20),
                    border: .all(
                      color: isSelected
                          ? AppTheme.primaryYellow
                          : colors.border,
                    ),
                  ),
                  child: Text(
                    tabs[index],
                    style: context.theme.typography.sm.copyWith(
                      fontWeight: isSelected ? .w600 : .w500,
                      color: isSelected
                          ? AppTheme.backgroundDark
                          : colors.textSecondary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
