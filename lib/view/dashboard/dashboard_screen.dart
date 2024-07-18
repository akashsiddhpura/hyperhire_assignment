import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hyperhire_assignment/controller/dashboard_controller.dart';
import 'package:hyperhire_assignment/generated/assets.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/view/home/home_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          border: Border(
            top: BorderSide(color: AppColors.unSelectedColor, width: 2),
            left: BorderSide(color: AppColors.unSelectedColor, width: 2),
            right: BorderSide(color: AppColors.unSelectedColor, width: 2),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: Obx(() {
            return BottomNavigationBar(
              backgroundColor: AppColors.backgroundColor,
              iconSize: 26,
              selectedItemColor: AppColors.selectedColor,
              unselectedItemColor: AppColors.unSelectedColor,
              unselectedLabelStyle: const TextStyle(color: AppColors.unSelectedColor),
              currentIndex: controller.currentIndex.value,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              onTap: controller.changeIndex,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: navBarIcon(Assets.iconsHomeIc, 0), label: "홈", tooltip: "Home"),
                BottomNavigationBarItem(icon: navBarIcon(Assets.iconsCategoryIc, 1), label: "카테고리", tooltip: "Category"),
                BottomNavigationBarItem(icon: navBarIcon(Assets.iconsCommunityIc, 2), label: "커뮤니티", tooltip: "Community"),
                BottomNavigationBarItem(icon: navBarIcon(Assets.iconsProfileIc, 3), label: "마이페이지", tooltip: "Profile"),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget navBarIcon(String icon, int index) {
    return Obx(() {
      return SvgPicture.asset(
        icon,
        color: controller.currentIndex.value == index ? AppColors.selectedColor : AppColors.unSelectedColor,
      );
    });
  }
}
