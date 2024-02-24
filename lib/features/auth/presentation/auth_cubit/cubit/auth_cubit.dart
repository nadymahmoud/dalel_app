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
  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;

  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccesState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errerMassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errerMassage: 'The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
      emit(SignUpFailureState(errerMassage: e.toString()));
    }
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
}
