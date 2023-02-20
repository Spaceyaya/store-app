import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/productModel.dart';

class AddProduct {
  Future<ProductModel> addproduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/LOGIN', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModel.fromjson(data);
  }
}
