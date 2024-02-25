class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccesState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errerMassage;

  SignUpFailureState({required this.errerMassage});
}

final class SignInLoadingState extends AuthState {}

final class SignInSuccesState extends AuthState {}

final class SignInFailureState extends AuthState {
  final String errerMassage;

  SignInFailureState({required this.errerMassage});
}

final class termsAndConditionState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}
