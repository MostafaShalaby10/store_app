import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/cart/view/cart_view.dart';
import 'package:shop_app/core/theme/view_model/cubit/theme_cubit.dart';

import 'core/utilis/service_locator.dart';
import 'core/utilis/shared_prefrences.dart';
import 'features/authentication/login/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await SharedPrefs.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:
          (context) => BlocProvider(
            create: (context) => ThemeCubit(),
            child: const MyApp(),
          ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Shop App',
              themeMode: ThemeCubit.get(context).themeMode,
              theme: ThemeCubit.get(context).lightTheme,

              darkTheme: ThemeCubit.get(context).darkTheme,

              home: const LoginView(),
            );
          },
        );
      },
    );
  }
}
