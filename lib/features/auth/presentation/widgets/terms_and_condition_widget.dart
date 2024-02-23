import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: AppStrings.iHaveAgreeToOur,
              style: CustomTextStyle.Poppins400style12),
          TextSpan(
              text: AppStrings.termsAndCondition,
              style: CustomTextStyle.Poppins400style12.copyWith(
                  decoration: TextDecoration.underline))
        ]))
      ],
    );
  }
}
