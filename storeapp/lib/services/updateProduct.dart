import '../helper/api.dart';
import '../models/productModel.dart';

class UpdateProductService {
  Future<ProductModel> updateproduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModel.fromjson(data);
  }
}
