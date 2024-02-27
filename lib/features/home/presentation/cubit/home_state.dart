class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodsSuccuss extends HomeState {}

final class GetHistoricalPeriodsFailure extends HomeState {
  final String errerMassage;

  GetHistoricalPeriodsFailure({required this.errerMassage});
}

final class GetHistoricalPeriodsLoading extends HomeState {}
