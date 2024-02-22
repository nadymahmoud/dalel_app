import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/custom_nav_bar.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              customNauvBar(),
              OnBoardingWidgetBody(),
              CustomButton(
                text: AppStrings.next,
              ),
              SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
