import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  OnBoardingWidgetBody(
      {super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: BouncingScrollPhysics(),
        controller: controller,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Container(
              width: 343,
              height: 290,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(onBoardingData[index].image))),
            ),
            SizedBox(
              height: 24,
            ),
            CustomSmoothPageIndicator(
              controller: controller,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              onBoardingData[index].title,
              style: CustomTextStyle.Poppins500style24.copyWith(
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              onBoardingData[index].subTitle,
              style: CustomTextStyle.Poppins300style16,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ]);
        },
      ),
    );
  }
}
