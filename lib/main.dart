import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/view/dashboard/dashboard_screen.dart';
import 'package:hyperhire_assignment/view/splash_screen.dart';

import 'utils/dependency_injection/global_screen_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Korean Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      initialBinding: GlobalScreenBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}

