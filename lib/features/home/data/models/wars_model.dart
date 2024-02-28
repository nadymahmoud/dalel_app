import 'package:dalel_app/core/models/data_model.dart';

class WarsModel extends DataModel {
  WarsModel(
      {required super.name, required super.image, required super.discription});
  factory WarsModel.fromJasn(jsonData) {
    return WarsModel(
        name: jsonData['name'],
        image: jsonData['image'],
        discription: jsonData['description']);
  }
}
