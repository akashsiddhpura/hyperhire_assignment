import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyperhire_assignment/generated/assets.dart';
import 'package:hyperhire_assignment/model/product_model.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/utils/size_extention.dart';

class ProductListWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductListWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.5.h,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: AppColors.unSelectedColor, width: 1), borderRadius: BorderRadius.circular(4)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      productModel.image,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          productModel.rank == 1
                              ? Assets.iconsCrown1
                              : productModel.rank == 2
                                  ? Assets.iconsCrown2
                                  : Assets.iconsCrown3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title,
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final text = productModel.description[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 4,
                              color: AppColors.blackColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                text,
                                style: const TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.iconsStarIc),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        productModel.ratingAverage.toString(),
                        style: const TextStyle(
                          color: AppColors.ratingColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(${productModel.ratingCount})",
                        style: const TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: 0,
                    verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.end,
                    children: productModel.tags.map((title) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.tagColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        margin: const EdgeInsets.all(0),
                        child: Text(
                          title,
                          style: const TextStyle(color: AppColors.greyColor, fontSize: 11),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
