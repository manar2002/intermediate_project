import 'package:nodaliza_store/api/helper/api.dart';
import '../model/product_model.dart';

class AllProductService {
  //method to return the products but to do that i need a model have these products
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data  =  await Api().get(url: 'https://fakestoreapi.com/products');

    // http.Response response =
    //     await http.get(Uri.parse('https://fakestoreapi.com/products'));
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