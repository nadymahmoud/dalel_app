import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccesState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, '/home')
              : showToast('Please verify your account!');
          ;
        } else if (state is SignInFailureState) {
          showToast(state.errerMassage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
            key: authCubit.singInFormKey,
            child: Column(
              children: [
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
                SizedBox(
                  height: 16,
                ),
                ForgotPasswordTextWidget(),
                SizedBox(
                  height: 102,
                ),
                state is SignInLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButtonWidget(
                        onPressed: () async {
                          if (authCubit.singInFormKey.currentState!
                              .validate()) {
                            await authCubit.signInWithEmailAndPassword();
                          }
                        },
                        text: AppStrings.signIn,
                      ),
              ],
            ));
      },
    );
  }
}
