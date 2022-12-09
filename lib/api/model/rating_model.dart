class RatingModel {
  final int count;
  final int rate;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromjson(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate']);
  }
}