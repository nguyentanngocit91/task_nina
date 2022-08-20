import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/themes/app_themes.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences _preferences;
  // Passing an initial value (state) with a default 'Locale' to the super class.
  ThemeCubit(this._preferences)
      : super(ThemeState(
      isDarkThemeOn: _preferences.getBool('isDarkThemeOn') ?? false));

  void toggleSwitch(bool value) {
    _preferences.setBool('isDarkThemeOn', value);
    return emit(state.copyWith(changeState: value));
  }
}


