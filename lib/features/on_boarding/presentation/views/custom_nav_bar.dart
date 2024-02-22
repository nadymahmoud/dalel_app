import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class customNauvBar extends StatelessWidget {
  const customNauvBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        AppStrings.skip,
        style: CustomTextStyle.Poppins300style16.copyWith(
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
