import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF5D5FEF);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFF868686);
  static const Color selectedColor = Color(0xFF767D88);
  static const Color unSelectedColor = Color(0xFFD7D7D7);
  static const Color ratingColor = Color(0xFFFFD233);
  static const Color tagColor = Color(0xFFF0F0F0);

  static const Gradient primaryGradiant = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF74FBDE),
      Color(0xFF3C41BF),
    ],
  );
}
