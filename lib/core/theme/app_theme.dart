import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';

class AppTheme {
  AppTheme._();

  // Primary colors
  static const Color primaryYellow = Color(0xFFFFC107);
  static const Color primaryYellowDark = Color(0xFFFFB300);

  // Dark theme colors
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color backgroundCardDark = Color(0xFF212136);
  static const Color backgroundSecondaryDark = Color(0xFF2A2A40);
  static const Color borderColorDark = Color(0xFF3A3A50);

  // Light theme colors
  static const Color backgroundLight = Color(0xFFF5F5F7);
  static const Color backgroundCardLight = Color(0xFFFFFFFF);
  static const Color backgroundSecondaryLight = Color(0xFFE8E8EC);
  static const Color borderColorLight = Color(0xFFD0D0D8);

  // Text colors
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFF9E9E9E);
  static const Color textMutedDark = Color(0xFF6B6B6B);

  static const Color textPrimaryLight = Color(0xFF1A1A2E);
  static const Color textSecondaryLight = Color(0xFF6B6B6B);
  static const Color textMutedLight = Color(0xFF9E9E9E);

  // Status colors
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFEF5350);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color infoBlue = Color(0xFF2196F3);

  static const Color backgroundCard = backgroundCardDark;
  static const Color backgroundSecondary = backgroundSecondaryDark;
  static const Color textPrimary = textPrimaryDark;
  static const Color textSecondary = textSecondaryDark;
  static const Color textMuted = textMutedDark;
  static const Color borderColor = borderColorDark;

  static final FColors _darkColors = FColors(
    brightness: .dark,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: backgroundDark,
    ),
    barrier: const Color(0x80000000),
    background: backgroundDark,
    foreground: textPrimaryDark,
    primary: primaryYellow,
    primaryForeground: backgroundDark,
    secondary: backgroundSecondaryDark,
    secondaryForeground: textPrimaryDark,
    muted: backgroundCardDark,
    mutedForeground: textSecondaryDark,
    destructive: errorRed,
    destructiveForeground: textPrimaryDark,
    error: errorRed,
    errorForeground: textPrimaryDark,
    border: borderColorDark,
    hoverLighten: 0.1,
    hoverDarken: 0.05,
    disabledOpacity: 0.4,
  );

  static final FColors _lightColors = FColors(
    brightness: .light,
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: backgroundLight,
    ),
    barrier: const Color(0x40000000),
    background: backgroundLight,
    foreground: textPrimaryLight,
    primary: primaryYellow,
    primaryForeground: textPrimaryLight,
    secondary: backgroundSecondaryLight,
    secondaryForeground: textPrimaryLight,
    muted: backgroundCardLight,
    mutedForeground: textSecondaryLight,
    destructive: errorRed,
    destructiveForeground: textPrimaryDark,
    error: errorRed,
    errorForeground: textPrimaryDark,
    border: borderColorLight,
    hoverLighten: 0.05,
    hoverDarken: 0.1,
    disabledOpacity: 0.4,
  );

  static const FTypography _typography = FTypography(
    defaultFontFamily: 'Inter',
  );

  static FStyle _buildStyle(FColors colors) => FStyle(
    formFieldStyle: FFormFieldStyle.inherit(
      colors: colors,
      typography: _typography,
    ),
    focusedOutlineStyle: FFocusedOutlineStyle(
      borderRadius: .circular(12),
      color: colors.primary,
    ),
    borderRadius: .circular(12),
    borderWidth: 1.0,
    iconStyle: IconThemeData(color: colors.primary, size: 24),
    tappableStyle: FTappableStyle(),
  );

  static FThemeData get darkTheme {
    final base = FThemes.zinc.dark;
    final style = _buildStyle(_darkColors);
    return base.copyWith(
      colors: _darkColors,
      typography: _typography,
      style: style.call,
      buttonStyles: FButtonStyles.inherit(
        colors: _darkColors,
        typography: _typography,
        style: style,
      ).call,
      textFieldStyle: FTextFieldStyle.inherit(
        colors: _darkColors,
        typography: _typography,
        style: style,
      ).call,
      cardStyle: FCardStyle.inherit(
        colors: _darkColors,
        typography: _typography,
        style: style,
      ).call,
      bottomNavigationBarStyle: FBottomNavigationBarStyle.inherit(
        colors: _darkColors,
        typography: _typography,
        style: style,
      ).call,
    );
  }

  static FThemeData get lightTheme {
    final base = FThemes.zinc.light;
    final style = _buildStyle(_lightColors);
    return base.copyWith(
      colors: _lightColors,
      typography: _typography,
      style: style.call,
      buttonStyles: FButtonStyles.inherit(
        colors: _lightColors,
        typography: _typography,
        style: style,
      ).call,
      textFieldStyle: FTextFieldStyle.inherit(
        colors: _lightColors,
        typography: _typography,
        style: style,
      ).call,
      cardStyle: FCardStyle.inherit(
        colors: _lightColors,
        typography: _typography,
        style: style,
      ).call,
      bottomNavigationBarStyle: FBottomNavigationBarStyle.inherit(
        colors: _lightColors,
        typography: _typography,
        style: style,
      ).call,
    );
  }

  static bool isMobile(double width) => width < 640;
  static bool isTablet(double width) => width >= 640 && width < 1024;
  static bool isDesktop(double width) => width >= 1024;

  static AppThemeColors getColors(Brightness brightness) {
    return brightness == .dark ? AppThemeColors.dark() : AppThemeColors.light();
  }
}

class AppThemeColors {
  final Color background;
  final Color backgroundCard;
  final Color backgroundSecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Brightness brightness;

  const AppThemeColors._({
    required this.background,
    required this.backgroundCard,
    required this.backgroundSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.brightness,
  });

  factory AppThemeColors.dark() => const AppThemeColors._(
    background: AppTheme.backgroundDark,
    backgroundCard: AppTheme.backgroundCardDark,
    backgroundSecondary: AppTheme.backgroundSecondaryDark,
    textPrimary: AppTheme.textPrimaryDark,
    textSecondary: AppTheme.textSecondaryDark,
    textMuted: AppTheme.textMutedDark,
    border: AppTheme.borderColorDark,
    brightness: .dark,
  );

  factory AppThemeColors.light() => const AppThemeColors._(
    background: AppTheme.backgroundLight,
    backgroundCard: AppTheme.backgroundCardLight,
    backgroundSecondary: AppTheme.backgroundSecondaryLight,
    textPrimary: AppTheme.textPrimaryLight,
    textSecondary: AppTheme.textSecondaryLight,
    textMuted: AppTheme.textMutedLight,
    border: AppTheme.borderColorLight,
    brightness: .light,
  );

  bool get isDark => brightness == .dark;
  bool get isLight => brightness == .light;
}

extension AppColorsExtension on FColors {
  Color get cardBackground => brightness == .dark
      ? AppTheme.backgroundCardDark
      : AppTheme.backgroundCardLight;

  Color get secondaryBackground => brightness == .dark
      ? AppTheme.backgroundSecondaryDark
      : AppTheme.backgroundSecondaryLight;

  Color get yellow => AppTheme.primaryYellow;
  Color get success => AppTheme.successGreen;
  Color get warning => AppTheme.warningOrange;
  Color get info => AppTheme.infoBlue;
}

extension AppThemeContextExtension on BuildContext {
  AppThemeColors get appColors {
    final brightness = theme.colors.brightness;
    return AppTheme.getColors(brightness);
  }

  bool get isDarkMode => theme.colors.brightness == .dark;
}
