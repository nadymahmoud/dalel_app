import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? firstName;
  String? lastName;

  String? emailAddress;

  String? password;
  GlobalKey<FormState> singUpFormKey = GlobalKey();
  GlobalKey<FormState> singInFormKey = GlobalKey();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();

  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;

  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      verifyEmail();
      emit(SignUpSuccesState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errerMassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errerMassage: 'The account already exists for that email.'));
      } else {
        emit(SignUpFailureState(errerMassage: e.code));
      }
    } catch (e) {
      print(e);
      emit(SignUpFailureState(errerMassage: e.toString()));
    }
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(termsAndConditionState());
  }

  obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress!, password: password!);
      emit(SignInSuccesState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errerMassage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errerMassage: 'Wrong password provided for that user.'));
      } else {
        emit(
            SignInFailureState(errerMassage: 'Check your Email and Password!'));
      }
    } catch (e) {
      emit(SignInFailureState(errerMassage: e.toString()));
    }
  }

  resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());

      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccesState());
    } catch (e) {
      emit(ResetPasswordFailureState(errerMassage: e.toString()));
    }
  }
}
