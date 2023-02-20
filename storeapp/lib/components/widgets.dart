
import 'package:flutter/material.dart';

import 'package:storeapp/models/productModel.dart';
import 'package:storeapp/screens/updateProductPage.dart';

// here to custmize card
class CustumCard extends StatelessWidget {
 const CustumCard({required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(1, 1),
                )
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 6),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 247, 84, 84),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: 32,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}

// here to custmize textfield
class CustomeTextFiled extends StatelessWidget {
  CustomeTextFiled(
      {this.textTybe, this.obscureText = false, this.onChange, this.hintText});
  String? hintText;
  bool? obscureText;
  TextInputType? textTybe;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textTybe,
      obscureText: obscureText!,
      onChanged: onChange,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
        hintText: hintText,
      ),
    );
  }
}

//  here to customize button
class Bottun extends StatelessWidget {
  Bottun({
    this.onchange,
    required this.title,
  });
  String title;

  VoidCallback? onchange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onchange,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
        width: double.infinity,
        height: 55,
      ),
    );
  }
}
