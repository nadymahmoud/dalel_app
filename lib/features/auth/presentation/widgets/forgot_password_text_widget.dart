import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigate(context, 'path');
      },
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.forgotPassword,
            style: CustomTextStyle.Poppins600style28.copyWith(fontSize: 12),
          )),
    );
  }
}
