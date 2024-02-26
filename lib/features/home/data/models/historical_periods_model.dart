class HistericalPeriodsModel {
  final String name;
  final String image;

  final String discription;

  final Map<String, dynamic> wars;

  HistericalPeriodsModel(
      {required this.name,
      required this.image,
      required this.discription,
      required this.wars});
  factory HistericalPeriodsModel.fromJson(jsonData) {
    return HistericalPeriodsModel(
        name: jsonData['name'],
        image: jsonData['image'],
        discription: jsonData['description'],
        wars: jsonData['wars']);
  }
}
