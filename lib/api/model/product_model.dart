class ProductModel {
  final int id;
  final String title;
  final String description;
  final dynamic price;
  final String image;
  // final RatingModel rating;

  ProductModel(
      {required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.image,
      });
  // required this.rating

//كل ما اقابل ماب اعاملها علي انها مودل و اعملها في كلاس
//لازم اعمل factory contructor بدل ما انا هجيب مودل من النت
  // اي داتا من علي النت هيا مودل جوها داتا تايبس كتيره لو من الانواع دي ماب اعاملها علي انها مودل بردو يعني اعملها كلاس
  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
    );
    // rating: RatingModel.fromjson(jsonData['rating'])
  }
}

//this model became a datatype