import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccesState) {
          showToast('Account Created Successfully');
          customReplacementNavigate(context, '/home');
        } else if (state is SignUpFailureState) {
          showToast(state.errerMassage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
            key: authCubit.singUpFormKey,
            child: Column(
              children: [
                CustomTextField(
                  onChanged: (fristName) {
                    authCubit.firstName = fristName;
                  },
                  labelText: AppStrings.fristName,
                ),
                CustomTextField(
                  onChanged: (lastName) {
                    authCubit.lastName = lastName;
                  },
                  labelText: AppStrings.lastName,
                ),
                CustomTextField(
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                  labelText: AppStrings.emailAddress,
                ),
                CustomTextField(
                  suffixIcon: IconButton(
                    icon: Icon(authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: () {
                      authCubit.obscurePasswordText();
                    },
                  ),
                  obscureText: authCubit.obscurePasswordTextValue,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                  labelText: AppStrings.password,
                ),
                TermsAndConditionWidget(),
                SizedBox(
                  height: 88,
                ),
                state is SignUpLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButtonWidget(
                        color: authCubit.termsAndConditionCheckBoxValue == false
                            ? AppColors.grey
                            : null,
                        onPressed: () {
                          if (authCubit.termsAndConditionCheckBoxValue ==
                              true) {
                            if (authCubit.singUpFormKey.currentState!
                                .validate()) {
                              authCubit.signUpWithEmailAndPassword();
                            }
                          }
                        },
                        text: AppStrings.signUp,
                      ),
              ],
            ));
      },
    );
  }
}
