import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/contsants/colors.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);
  bool isdark = false;
  ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 10),
    ),
  );

  ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
  );

  ThemeMode themeMode = ThemeMode.light;

  void changeTheme() {
    isdark = !isdark;
    themeMode == ThemeMode.light
        ? themeMode = ThemeMode.dark
        : themeMode = ThemeMode.light;
    emit(ChangeTheme());
  }
}
