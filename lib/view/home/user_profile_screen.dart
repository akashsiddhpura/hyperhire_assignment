import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyperhire_assignment/generated/assets.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/utils/size_extention.dart';

class UserProfileScreen extends StatelessWidget {
  final String profileImage;
  final int index;
  UserProfileScreen({
    super.key,
    required this.profileImage,
    required this.index,
  });

  final List<String> filterList = ["“가격 저렴해요”", "“CPU온도 고온”", "“서멀작업 가능해요”", "“게임 잘 돌아가요”", "“발열이 적어요”"];
  final List<String> reviewImageList = [Assets.imagesReviewImg1, Assets.imagesReviewImg2, Assets.imagesReviewImg3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "랭킹 1위",
              style: TextStyle(color: AppColors.greyColor, fontSize: 10),
            ),
            Text(
              "베스트 리뷰어",
              style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
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
          /// Profile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset(
                    profileImage,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "NAME${(index + 1).toString().padLeft(2, '0')}",
                  style: const TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Visibility(
                  visible: index == 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.iconsCrown),
                      const SizedBox(width: 5),
                      const Text(
                        "골드",
                        style: TextStyle(color: AppColors.ratingColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.tagColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: const Text(
                    "조립컴 업체를 운영하며 리뷰를 작성합니다.",
                    style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                )
              ],
            ),
          ),

          const Divider(
            color: AppColors.tagColor,
            thickness: 14,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      "작성한 리뷰",
                      style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "총 35개",
                      style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 12),
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
                      "최신순",
                      style: TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400, fontSize: 11),
                    ),
                    isExpanded: true,
                    isDense: true,
                    padding: EdgeInsets.zero,
                    underline: DropdownButtonHideUnderline(child: Container()),
                    items: <String>['최신순', '최신순', '최신순', '최신순'].map((String value) {
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
          ),
          const Divider(
            color: AppColors.unSelectedColor,
            height: 1,
          ),

          Container(
            height: 12.5.h,
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: AppColors.unSelectedColor, width: 1), borderRadius: BorderRadius.circular(4)),
                      child: Image.asset(
                        Assets.imagesUserProfileProduct,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "AMD 라이젠 5 5600X 버미어 \n정품 멀티팩",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        /// rating
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                      child: SvgPicture.asset(
                                        Assets.iconsStarIc,
                                        height: 18,
                                        color: index < 4.07.toInt() ? AppColors.ratingColor : AppColors.unSelectedColor,
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("4.07", style: TextStyle(color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: AppColors.unSelectedColor,
              height: 1,
            ),
          ),

          /// review
          ListTile(
            leading: Image.asset(
              profileImage,
              width: 35,
              height: 35,
            ),
            title: Text(
              "NAME${(index + 1).toString().padLeft(2, '0')}",
              style: const TextStyle(color: AppColors.blackColor, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            subtitle: Row(
              children: [
                SizedBox(
                  height: 12,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: SvgPicture.asset(
                            Assets.iconsStarIc,
                            height: 11,
                            color: index < 4.07.toInt() ? AppColors.ratingColor : AppColors.unSelectedColor,
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("2022.12.09", style: TextStyle(color: AppColors.greyColor, fontSize: 10, fontWeight: FontWeight.w400)),
              ],
            ),
            trailing: SvgPicture.asset(Assets.iconsSaveIc),
          ),
          Container(
            height: 15,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                ...filterList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      e,
                      style: TextStyle(color: AppColors.blackColor.withOpacity(0.4), fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  );
                })
              ],
            ),
          ),
          ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            leading: SvgPicture.asset(
              Assets.iconsEnergyIc,
              width: 10,
            ),
            contentPadding: const EdgeInsets.only(left: 35, right: 15),
            minLeadingWidth: 10,
            title: const Text("멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.", style: TextStyle(color: AppColors.greyColor, fontSize: 14, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            leading: SvgPicture.asset(
              Assets.iconsEnergyIc,
              color: AppColors.unSelectedColor,
              width: 10,
            ),
            contentPadding: const EdgeInsets.only(left: 35, right: 15),
            minLeadingWidth: 10,
            title: const Text("3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.", style: TextStyle(color: AppColors.greyColor, fontSize: 14, fontWeight: FontWeight.w400)),
          ),

          Container(
            height: 75,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                ...reviewImageList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.asset(e, width: 73, height: 73, fit: BoxFit.fill)),
                  );
                })
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: AppColors.unSelectedColor,
              height: 1,
            ),
          ),


          /// FOOTER
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.iconsChatIc),
                    SizedBox(width: 10,),
                    Text(
                      "댓글 달기..",
                      style: TextStyle(color: AppColors.greyColor, fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.tagColor,
                thickness: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
