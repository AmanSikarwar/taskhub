import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class OnboardingSlide {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const OnboardingSlide({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class OnboardingSlideWidget extends StatelessWidget {
  final OnboardingSlide slide;
  final bool isDesktop;

  const OnboardingSlideWidget({
    super.key,
    required this.slide,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    if (isDesktop) {
      return Center(
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            color: slide.color.withValues(alpha: 0.1),
            shape: .circle,
          ),
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: slide.color.withValues(alpha: 0.2),
                shape: .circle,
              ),
              child: Icon(slide.icon, size: 80, color: slide.color),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const .all(24),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: slide.color.withValues(alpha: 0.1),
              shape: .circle,
            ),
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: slide.color.withValues(alpha: 0.2),
                  shape: .circle,
                ),
                child: Icon(slide.icon, size: 56, color: slide.color),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            slide.title,
            style: context.theme.typography.xl2.copyWith(
              fontWeight: .bold,
              color: colors.textPrimary,
            ),
            textAlign: .center,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const .symmetric(horizontal: 16),
            child: Text(
              slide.description,
              style: context.theme.typography.base.copyWith(
                color: colors.textSecondary,
                height: 1.6,
              ),
              textAlign: .center,
            ),
          ),
        ],
      ),
    );
  }
}
