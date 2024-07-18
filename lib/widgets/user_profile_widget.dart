import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hyperhire_assignment/generated/assets.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/utils/size_extention.dart';
import 'package:hyperhire_assignment/view/home/user_profile_screen.dart';

class UserProfileWidget extends StatelessWidget {
  final String userProfileImg;
  final int index;
  const UserProfileWidget({super.key, required this.userProfileImg, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => UserProfileScreen(profileImage: userProfileImg, index: index));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: index == 0 ? AppColors.ratingColor : Colors.transparent, width: 4.0),
                    shape: BoxShape.circle,
                  ),
                  child: Image(
                    image: AssetImage(userProfileImg),
                    alignment: Alignment.center,
                    width: 15.w,
                  ),
                ),
              ),
              Visibility(visible: index == 0, child: SvgPicture.asset(Assets.iconsCrown)),
            ],
          ),
          Text(
            "NAME${(index + 1).toString().padLeft(2, '0')}",
            style: TextStyle(
              color: AppColors.blackColor.withOpacity(.6),
            ),
          )
        ],
      ),
    );
  }
}
