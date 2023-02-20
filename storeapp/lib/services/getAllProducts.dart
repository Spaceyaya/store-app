import 'dart:convert';
import 'package:http/http.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/productModel.dart';

class AllProductsSerives {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
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
