import '../helper/api.dart';
import '../model/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  }) async {
    Map<String, dynamic> data =
    await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    }, token: '');
    return ProductModel.fromjson(data);
  }
}