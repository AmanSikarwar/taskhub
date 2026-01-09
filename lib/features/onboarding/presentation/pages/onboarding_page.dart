import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/services/onboarding_service.dart';
import '../widgets/onboarding_slide.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;

  final _onboardingSlides = const [
    OnboardingSlide(
      icon: FIcons.clipboardList,
      title: 'Organize Your Tasks',
      description:
          'Create, organize, and prioritize your tasks with ease. Never miss a deadline again.',
      color: AppTheme.primaryYellow,
    ),
    OnboardingSlide(
      icon: FIcons.users,
      title: 'Collaborate with Team',
      description:
          'Work together with your team on projects. Assign tasks, track progress, and achieve goals together.',
      color: AppTheme.infoBlue,
    ),
    OnboardingSlide(
      icon: FIcons.calendar,
      title: 'Plan Your Schedule',
      description:
          'View your tasks on a calendar. Plan ahead and manage your time effectively.',
      color: AppTheme.successGreen,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingSlides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  Future<void> _completeOnboarding() async {
    await getIt<OnboardingService>().completeOnboarding();
    if (mounted) {
      const SignUpRoute().go(context);
    }
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
          child: isDesktop
              ? _buildDesktopLayout(context, colors)
              : _buildMobileLayout(context, colors),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, AppThemeColors colors) {
    return Column(
      children: [
        Padding(
          padding: const .symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              const SizedBox(width: 60),
              _buildPageIndicators(colors),
              SizedBox(
                width: 60,
                child: FTappable(
                  onPress: _skipOnboarding,
                  child: Text(
                    'Skip',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _onboardingSlides.length,
            itemBuilder: (context, index) => OnboardingSlideWidget(
              slide: _onboardingSlides[index],
              isDesktop: false,
            ),
          ),
        ),
        Padding(
          padding: const .all(24),
          child: SizedBox(
            width: double.infinity,
            child: FButton(
              onPress: _nextPage,
              child: Text(
                _currentPage == _onboardingSlides.length - 1
                    ? 'Get Started'
                    : 'Next',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, AppThemeColors colors) {
    return Row(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _onboardingSlides.length,
            itemBuilder: (context, index) => OnboardingSlideWidget(
              slide: _onboardingSlides[index],
              isDesktop: true,
            ),
          ),
        ),
        Container(
          width: 400,
          padding: const .all(48),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .stretch,
            children: [
              Text(
                _onboardingSlides[_currentPage].title,
                style: context.theme.typography.xl3.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _onboardingSlides[_currentPage].description,
                style: context.theme.typography.base.copyWith(
                  color: colors.textSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 48),
              _buildPageIndicators(colors),
              const SizedBox(height: 48),
              FButton(
                onPress: _nextPage,
                child: Text(
                  _currentPage == _onboardingSlides.length - 1
                      ? 'Get Started'
                      : 'Next',
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: FTappable(
                  onPress: _skipOnboarding,
                  child: Text(
                    'Skip',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicators(AppThemeColors colors) {
    return Row(
      mainAxisAlignment: .center,
      children: List.generate(
        _onboardingSlides.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const .symmetric(horizontal: 4),
          width: _currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? AppTheme.primaryYellow
                : colors.backgroundSecondary,
            borderRadius: .circular(4),
          ),
        ),
      ),
    );
  }
}
