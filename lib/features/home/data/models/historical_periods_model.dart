import 'package:dalel_app/core/models/data_model.dart';
import 'package:dalel_app/features/home/data/models/wars_model.dart';

class HistericalPeriodsModel extends DataModel {
  final List<WarsModel> wars;

  HistericalPeriodsModel(
      {required super.name,
      required super.image,
      required super.discription,
      required this.wars});
  factory HistericalPeriodsModel.fromJson(jsonData, warsList) {
    return HistericalPeriodsModel(
        name: jsonData['name'],
        image: jsonData['image'],
        discription: jsonData['description'],
        wars: warsList);
  }
}
