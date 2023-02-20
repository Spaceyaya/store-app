import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/productModel.dart';

class GetAllProducts {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromjson(
          data[i],
        ),
      );
    }
    return productList;
  }
}
