import 'package:nodaliza_store/api/helper/api.dart';

import '../model/product_model.dart';

class Categories {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName', body: null, token: '');
//باخد الريسبونس بعمله ديكود و اكسس علي البادي و احطه في ليست عشان اصلا البادي عباره عن ليست
    //الداتا تايبسعباره عن ليست داينمك او ماب اوف استرنج و داينامك
    //لازم اعمل تشيك علي ال ستيتس كود قبل ما استخدم البادي


    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromjson(data[i]));
    }
    return productList;

  }
}