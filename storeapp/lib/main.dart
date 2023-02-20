import 'package:flutter/material.dart';
import 'package:storeapp/screens/homePage.dart';
import 'package:storeapp/screens/updateProductPage.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProduct.id :(context) => UpdateProduct(),
      },
      initialRoute: HomePage.id,
    );
  }
}
