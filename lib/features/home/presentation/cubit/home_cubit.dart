// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/data/models/wars_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistericalPeriodsModel> historicalPeriods = [];
  List<WarsModel> warsList = [];

  getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then((value) => value.docs.forEach((element) async {
                await getWarsList(element);
                historicalPeriods.add(
                    HistericalPeriodsModel.fromJson(element.data(), warsList));
                emit(GetHistoricalPeriodsSuccuss());
              }));
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errerMassage: e.toString()));
    }
  }

  Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection('wars')
        .get()
        .then((value) => value.docs.forEach((element) {
              warsList.add(WarsModel.fromJasn(element.data()));
            }));
  }
}
