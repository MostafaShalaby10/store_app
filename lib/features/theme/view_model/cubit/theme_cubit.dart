import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
static ThemeCubit get(context) => BlocProvider.of(context);

    ThemeData theme = ThemeData.light();

  void changeTheme() {
    theme == ThemeData.light()
        ? theme = ThemeData.dark()
        : theme = ThemeData.light();
    emit(ChangeTheme());
  }
}
