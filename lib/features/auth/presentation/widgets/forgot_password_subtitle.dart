import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSubTitle extends StatelessWidget {
  const ForgotPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Text(
        'Enter your registered email below to receive password reset instruction',
        style: CustomTextStyle.Poppins400style12,
        textAlign: TextAlign.center,
      ),
    );
  }
}
