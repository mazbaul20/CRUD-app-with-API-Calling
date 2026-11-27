import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../data/model/product_model.dart';
import '../widgets/custom_text_form_field.dart';
import 'home_screen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productQtyController = TextEditingController();
  final TextEditingController _productUnitPriceController =
      TextEditingController();
  final TextEditingController _productTotalPriceController =
      TextEditingController();

  Client http = Client();
  bool inProgress = false;
  ProductModel productModel = ProductModel();

  Future<void> addProduct() async {
    inProgress = true;
    setState(() {});

    Uri uri = Uri.parse(
      'https://crud-api-ostad-live.onrender.com/api/v1/CreateProduct',
    );

    Response response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "ProductName": _productNameController.text,
        "ProductCode": int.parse(_productCodeController.text).toInt(),
        "Img": _productImageController.text,
        "Qty": int.parse(_productQtyController.text).toInt(),
        "UnitPrice": int.parse(_productUnitPriceController.text).toInt(),
        "TotalPrice": int.parse(_productTotalPriceController.text).toInt(),
      }),
    );

    final responseJson = jsonDecode(response.body);

    if (responseJson['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product Created Successfully"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed Successfully"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
    _productNameController.clear();
    _productCodeController.clear();
    _productImageController.clear();
    _productQtyController.clear();
    _productUnitPriceController.clear();
    _productTotalPriceController.clear();

    inProgress = false;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _productNameController.dispose();
    _productCodeController.dispose();
    _productImageController.dispose();
    _productQtyController.dispose();
    _productUnitPriceController.dispose();
    _productTotalPriceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            CustomTextFormField(
              controllerName: _productNameController,
              hintText: "Product Name",
            ),
            CustomTextFormField(
              controllerName: _productCodeController,
              hintText: "Product Code",
            ),
            CustomTextFormField(
              controllerName: _productImageController,
              hintText: "Image",
            ),
            CustomTextFormField(
              controllerName: _productQtyController,
              hintText: "Qty",
            ),
            CustomTextFormField(
              controllerName: _productUnitPriceController,
              hintText: "Unit price",
            ),
            CustomTextFormField(
              controllerName: _productTotalPriceController,
              hintText: "Total price",
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  await addProduct();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
                  );
                },
                child: Text(
                  "Product Save",
                  style: TextStyle(fontSize: 18, fontWeight: .w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
