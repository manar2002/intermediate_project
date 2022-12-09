import 'package:nodaliza_store/api/helper/api.dart';
import 'package:nodaliza_store/api/model/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  }) async {
    Map<String,dynamic> data= await Api().post(url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        }, token: '');
    return ProductModel.fromjson(data);
  }
}