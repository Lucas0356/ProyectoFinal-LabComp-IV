import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/config/theme/app_theme.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier

class ThemeNotifier extends StateNotifier<AppTheme> {
  // State = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  // Cambiar DarkMode
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
