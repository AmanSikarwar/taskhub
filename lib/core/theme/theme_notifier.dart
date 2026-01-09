import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import 'app_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = .dark;

  ThemeNotifier({ThemeMode initialMode = .dark}) : _themeMode = initialMode;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == .dark;
  bool get isLightMode => _themeMode == .light;
  bool get isSystemMode => _themeMode == .system;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  void toggleTheme() {
    _themeMode = _themeMode == .dark ? .light : .dark;
    notifyListeners();
  }

  void setDarkMode() => setThemeMode(.dark);

  void setLightMode() => setThemeMode(.light);

  void setSystemMode() => setThemeMode(.system);

  FThemeData getTheme(Brightness systemBrightness) {
    return getEffectiveBrightness(systemBrightness) == .dark
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
  }

  Brightness getEffectiveBrightness(Brightness systemBrightness) {
    return switch (_themeMode) {
      .dark => .dark,
      .light => .light,
      .system => systemBrightness,
    };
  }
}

class ThemeProvider extends InheritedNotifier<ThemeNotifier> {
  const ThemeProvider({
    super.key,
    required ThemeNotifier notifier,
    required super.child,
  }) : super(notifier: notifier);

  static ThemeNotifier of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<ThemeProvider>();
    return provider!.notifier!;
  }

  static ThemeNotifier? maybeOf(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<ThemeProvider>();
    return provider?.notifier;
  }
}

extension ThemeNotifierExtension on BuildContext {
  ThemeNotifier get themeNotifier => ThemeProvider.of(this);

  void toggleTheme() => themeNotifier.toggleTheme();

  void setDarkMode() => themeNotifier.setDarkMode();

  void setLightMode() => themeNotifier.setLightMode();
}
