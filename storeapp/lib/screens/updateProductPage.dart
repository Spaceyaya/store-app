import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/components/widgets.dart';
import 'package:storeapp/models/productModel.dart';
import 'package:storeapp/services/updateProduct.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({Key? key}) : super(key: key);
  static String id = 'updateProduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              CustomeTextFiled(
                hintText: 'Product Name',
                onChange: (data) {
                  productName = data;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextFiled(
                hintText: 'Description',
                onChange: (data) {
                  description = data;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextFiled(
                textTybe: TextInputType.number,
                hintText: 'Price',
                onChange: (data) {
                  price = data;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextFiled(
                hintText: 'Image',
                onChange: (data) {
                  image = data;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Bottun(
                title: 'Update',
                onchange: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print('Success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

 Future <void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateproduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
