import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';

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
                onPressed: () {},
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
