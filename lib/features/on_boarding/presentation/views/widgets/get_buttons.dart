import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentindex, required this.controller});
  final int currentindex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentindex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomButtonWidget(
            text: AppStrings.createAccount,
            onPressed: () {
              onboardingVisited();
              customReplacementNavigate(context, '/signUp');
            },
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              onboardingVisited();
              customReplacementNavigate(context, "/signIn");
            },
            child: Text(
              AppStrings.loginNow,
              style: CustomTextStyle.Poppins300style16.copyWith(
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );
    } else {
      return CustomButtonWidget(
        onPressed: () {
          controller.nextPage(
              duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
        },
        text: AppStrings.next,
      );
    }
  }
}
