import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 152,
              ),
            ),
            SliverToBoxAdapter(
              child: WelcomeTextWidget(
                text: AppStrings.welcome,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.fristName,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.lastName,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.emailAddress,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.password,
              ),
            ),
            SliverToBoxAdapter(
              child: TermsAndConditionWidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 88,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomButtonWidget(
                onPressed: () {},
                text: AppStrings.signUp,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signUp),
            )
          ],
        ),
      ),
    );
  }
}

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key, required this.text1, required this.text2});
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: text1, style: CustomTextStyle.Poppins400style12),
        TextSpan(
            text: text2,
            style: CustomTextStyle.Poppins400style12.copyWith(
                color: AppColors.lightGrey)),
      ])),
    );
  }
}
