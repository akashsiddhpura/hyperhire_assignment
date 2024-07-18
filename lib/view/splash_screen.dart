import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/view/dashboard/dashboard_screen.dart';

import '../utils/dependency_injection/global_screen_bindings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(
        () => const DashboardScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Korian Shop Demo".toUpperCase(),
                style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: LinearProgressIndicator(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
