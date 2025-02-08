import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences prefs;

  ThemeCubit({required this.prefs}) : super(LightThemeStates()) {
    _getThemeFromPrefs();
  }

  Future<void> _getThemeFromPrefs() async {
    final savedThemeIndex = prefs.getInt('theme') ?? 0; // Use this.prefs
    final savedTheme = savedThemeIndex == 0 ? LightThemeStates() : DarkThemeStates();
    emit(savedTheme);
  }
  Future<void> _saveThemeToPrefs({required ThemeState themeState}) async {
    final themeIndex = themeState is LightThemeStates ? 0 : 1;
    await prefs.setInt('theme', themeIndex); // Use this.prefs
  }

  Future<void> toggleTheme() async { // Make toggleTheme async
    final newState = state is LightThemeStates ? DarkThemeStates() : LightThemeStates();
    await _saveThemeToPrefs(themeState: newState); // Save BEFORE emitting
    emit(newState); // Emit AFTER saving
  }
}