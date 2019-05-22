import 'package:flutter/material.dart';
import 'package:movies/bloc/utils.dart';

class ChangeThemeState {
  final ThemeData themeData;

  ChangeThemeState({@required this.themeData});

  factory ChangeThemeState.lightTheme() {
    return ChangeThemeState(themeData: kLightTheme);
  }

  factory ChangeThemeState.darkTheme() {
    return ChangeThemeState(themeData: kDarkTheme);
  }
  factory ChangeThemeState.amoledTheme() {
    return ChangeThemeState(themeData: kAmoledTheme);
  }
}
