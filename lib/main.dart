import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utilis/service_locator.dart';
import 'core/utilis/shared_prefrences.dart';
import 'features/login/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await SharedPrefs.init();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const LoginView(),
        );
      },
    );
  }
}
