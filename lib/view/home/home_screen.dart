import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:hyperhire_assignment/controller/home_controller.dart';
import 'package:hyperhire_assignment/generated/assets.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/utils/size_extention.dart';
import 'package:hyperhire_assignment/widgets/image_slider.dart';
import 'package:hyperhire_assignment/widgets/user_profile_widget.dart';
import 'package:hyperhire_assignment/widgets/vertical_divider.dart';

import '../../widgets/product_list_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SvgPicture.asset(Assets.imagesLogo),
        ),
        leadingWidth: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: AppColors.unSelectedColor,
            height: 2.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: GradientOutlineInputBorder(
                  gradient: AppColors.primaryGradiant,
                  width: 2,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: GradientOutlineInputBorder(
                  gradient: AppColors.primaryGradiant,
                  width: 2,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "검색어를 입력하세요",
                hintStyle: const TextStyle(color: AppColors.greyColor, fontSize: 14),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    Assets.iconsSearchIc,
                  ),
                ),
              ),
            ),
          ),

          // Image Slider
          ImageSlider(),

          /// Review
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: () {},
              title: const Text(
                "제일 핫한 리뷰를 만나보세요",
                style: TextStyle(color: AppColors.greyColor, fontSize: 12),
              ),
              subtitle: const Text(
                "리뷰️  랭킹⭐ top 3",
                style: TextStyle(color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing: SvgPicture.asset(
                Assets.iconsRightArrowIc,
                width: 8,
              ),
            ),
          ),

          /// Product List
          ListView.builder(
            itemBuilder: (context, index) => ProductListWidget(productModel: controller.productList[index]),
            itemCount: controller.productList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),

          const Divider(
            color: AppColors.tagColor,
            thickness: 14,
          ),

          /// User List
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: ListTile(
              title: Text(
                "골드 계급 사용자들이예요",
                style: TextStyle(color: AppColors.greyColor, fontSize: 12),
              ),
              subtitle: Text(
                "베스트 리뷰어 🏆 Top10",
                style: TextStyle(color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 13.5.h,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                crossAxisCount: 1,
                childAspectRatio: 1.35,
              ),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserProfileWidget(
                  userProfileImg: controller.userProfileImageList[index],
                  index: index,
                ),
              ),
              itemCount: controller.userProfileImageList.length,
              shrinkWrap: true,
            ),
          ),

          /// Footer
          Container(
            color: AppColors.tagColor,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "LOGO Inc.",
                  style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w500, fontSize: 14),
                ),
                const IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "회사 소개",
                          style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                        VerticalDividerRounded(),
                        Text(
                          "회사 소개",
                          style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                        VerticalDividerRounded(),
                        Text(
                          "회사 소개 ",
                          style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                        VerticalDividerRounded(),
                        Text(
                          "회사 소개 ",
                          style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsSendIc),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "review@logo.com",
                          style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                      ],
                    ),
                    Container(
                      width: 80.0,
                      padding: const EdgeInsets.only(left: 10.0, right: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(color: AppColors.greyColor, width: 1),
                      ),
                      child: DropdownButton<String>(
                        hint: const Text(
                          "KOR",
                          style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 11),
                        ),
                        isExpanded: true,
                        isDense: true,
                        padding: EdgeInsets.zero,
                        underline: DropdownButtonHideUnderline(child: Container()),
                        items: <String>['KOR', 'JPN', 'ENG', 'CHN'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 11),
                            ),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Divider(
                    color: AppColors.unSelectedColor,
                    height: 1,
                  ),
                ),
                const Text(
                  "@2022-2022 LOGO Lab, Inc. (주)아무개  서울시 강남구",
                  style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
