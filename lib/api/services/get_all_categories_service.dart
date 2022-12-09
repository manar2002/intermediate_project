import '../helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products/categories', body: null, token: '');
    return data;
  }
}