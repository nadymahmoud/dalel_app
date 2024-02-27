import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCategory extends StatelessWidget {
  const CustomShimmerCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 164.0,
          height: 96.0,
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: Colors.white,
            child: Container(
                decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(5),
            )),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 164.0,
          height: 96.0,
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: Colors.white,
            child: Container(
                decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(5),
            )),
          ),
        ),
      ],
    );
  }
}
