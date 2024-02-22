import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.color, required this.text});
  final Color? color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: color ?? AppColors.primaryColor),
          child: Text(
            text,
            style: CustomTextStyle.Poppins500style24.copyWith(
                fontSize: 16, color: AppColors.offWhite),
          )),
    );
  }
}
