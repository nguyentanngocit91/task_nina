import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../l10n/l10n.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final SharedPreferences _preferences;


  // Passing an initial value (state) with a default 'Locale' to the super class.
  LocaleCubit(this._preferences)
      : super(SelectedLocale(Locale(_preferences.getString('locale') ?? 'vi')));


  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    //_preferences.setString('locale', locale1);
    emit(SelectedLocale(locale));
  }

  void clearLocale() {
   // _locale = null;
    //notifyListeners();
  }

}
