// lib/core/theme/theme_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'app_theme_mode';

  ThemeCubit() : super(const ThemeState(ThemeMode.system));

  Future<void> loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getString(_themeKey);
      if (saved != null) {
        final mode = ThemeMode.values.firstWhere(
          (e) => e.toString() == saved,
          orElse: () => ThemeMode.system,
        );
        emit(ThemeState(mode));
      }
    } catch (_) {
      // silent fail → keep system
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, mode.toString());
      emit(ThemeState(mode));
    } catch (_) {}
  }

  void toggleTheme() {
    final current = state.mode;
    final next = current == ThemeMode.light
        ? ThemeMode.dark
        : current == ThemeMode.dark
            ? ThemeMode.system
            : ThemeMode.light;
    setTheme(next);
  }
}
