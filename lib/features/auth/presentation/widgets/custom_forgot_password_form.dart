import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccesState) {
          showToast('Check your email to Reset your password');
          customReplacementNavigate(context, '/signIn');
        } else if (state is ResetPasswordFailureState) {
          showToast(state.errerMassage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: authCubit.resetPasswordFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    onChanged: (emailAddress) {
                      authCubit.emailAddress = emailAddress;
                    },
                    labelText: AppStrings.emailAddress,
                  ),
                  SizedBox(
                    height: 129,
                  ),
                  state is ResetPasswordLoadingState
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : CustomButtonWidget(
                          onPressed: () async {
                            if (authCubit.resetPasswordFormKey.currentState!
                                .validate()) {
                              await authCubit.resetPasswordWithLink();
                            }
                          },
                          text: AppStrings.sendResetPasswordLink,
                        ),
                ],
              )),
        );
      },
    );
  }
}
