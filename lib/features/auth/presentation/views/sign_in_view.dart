import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_sign_in_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/have_an_account.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: WelcomeBanner(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(
              text: AppStrings.welcomeBack,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomSignInForm(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () {
                customReplacementNavigate(context, '/signUp');
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
        ],
      ),
    );
  }
}
