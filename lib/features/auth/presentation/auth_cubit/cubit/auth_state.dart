class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccesState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errerMassage;

  SignUpFailureState({required this.errerMassage});
}
