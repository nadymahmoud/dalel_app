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
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
            child: Column(
          children: [
            CustomTextField(
              onChanged: (fristName) {
                BlocProvider.of<AuthCubit>(context).firstName = fristName;
              },
              labelText: AppStrings.fristName,
            ),
            CustomTextField(
              onChanged: (lastName) {
                BlocProvider.of<AuthCubit>(context).lastName = lastName;
              },
              labelText: AppStrings.lastName,
            ),
            CustomTextField(
              onChanged: (emailAddress) {
                BlocProvider.of<AuthCubit>(context).emailAddress = emailAddress;
              },
              labelText: AppStrings.emailAddress,
            ),
            CustomTextField(
              onChanged: (password) {
                BlocProvider.of<AuthCubit>(context).password = password;
              },
              labelText: AppStrings.password,
            ),
            TermsAndConditionWidget(),
            SizedBox(
              height: 88,
            ),
            CustomButtonWidget(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context)
                    .signUpWithEmailAndPassword();
              },
              text: AppStrings.signUp,
            ),
          ],
        ));
      },
    );
  }
}
