import 'package:flutter/material.dart';
import 'package:hyperhire_assignment/utils/colors.dart';

class VerticalDividerRounded extends StatelessWidget {
  final double? width;
  final double? thickness;
  final Color? color;
  const VerticalDividerRounded({super.key, this.width, this.thickness, this.color, });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child:  VerticalDivider(
        width: width ?? 15,
        color: color ?? AppColors.unSelectedColor,
        thickness: thickness ?? 1,
      ),
    );
  }
}
