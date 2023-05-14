import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mova/core/theme/space_theme.dart';

import '../../core/theme/cream_theme.dart';
import '../../core/theme/dark_theme.dart';
import '../../core/util/enums.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: spaceTheme)) {
    on<ThemeEvent>((event, emit) {
      switch (event.theme) {
        case AppTheme.darkTheme:
          emit(ThemeState(themeData: darkTheme));
          break;
        case AppTheme.lightTheme:
          emit(ThemeState(themeData: creamTheme));
          break;
        case AppTheme.spaceTheme:
          emit(ThemeState(themeData: spaceTheme));
          break;
        default:
          emit(ThemeState(themeData: darkTheme));
          break;
      }
    });
  }
}
