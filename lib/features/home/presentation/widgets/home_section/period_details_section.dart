import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PeriodDetailsSection extends StatelessWidget {
  const PeriodDetailsSection(
      {super.key,
      required this.periodName,
      required this.description,
      required this.imageUrl});
  final String periodName;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(text: '${AppStrings.about} $periodName'),
            SizedBox(
              width: 7,
            ),
            SvgPicture.asset(Assets.imagesDetails1)
          ],
        ),
        SizedBox(
          height: 47,
        ),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -24,
                  child: SvgPicture.asset(Assets.imagesDetails2),
                ),
                SizedBox(
                    width: 196,
                    height: 220,
                    child: Text(
                      description,
                      style: CustomTextStyle.Poppins500style14.copyWith(
                          color: AppColors.black),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            SizedBox(
              height: 203,
              width: 131,
              child: CachedNetworkImage(imageUrl: imageUrl),
            ),
          ],
        ),
      ],
    );
  }
}
