import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperhire_assignment/controller/home_controller.dart';
import 'package:hyperhire_assignment/utils/colors.dart';
import 'package:hyperhire_assignment/utils/padding_extention.dart';
import 'package:hyperhire_assignment/utils/size_extention.dart';

import '../generated/assets.dart';

class ImageSlider extends GetView<HomeController> {
  ImageSlider({super.key});

  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: controller.images.length,
          itemBuilder: (context, index, realIndex) {
            return Image.asset(
              controller.images[index],
              fit: BoxFit.cover,
              height: 26.h,
              width: double.infinity,
            );
          },
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: 26.h,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0,
            scrollDirection: Axis.horizontal,
            onPageChanged: controller.onItemChanged,
          ),
        ),
        Positioned(
          bottom: 0.w,
          child: Container(
            alignment: Alignment.center,
            padding: 10.vertical,
            child: SingleChildScrollView(
              child: Obx(() {
                return DotsIndicator(
                  dotsCount: controller.images.length,
                  axis: Axis.horizontal,
                  position: controller.currentIndex.value,
                  decorator: DotsDecorator(
                    size: const Size.square(4.0),
                    activeSize: const Size(9.0, 4.0),
                    spacing: const EdgeInsets.symmetric(horizontal: 4.0),
                    color: AppColors.whiteColor.withOpacity(.5),
                    activeColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
