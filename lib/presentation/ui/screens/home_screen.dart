import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/product_info.dart';
import '../widgets/update_product_dialog.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text("Todo"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductInfo(
                        productTitle: "Product Name: Asus",
                        fontSize: 24,
                        fontWeight: .w700,
                      ),
                      ProductInfo(
                        productTitle: "Product Code #3291",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Image: image",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Qty: 11",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Unit Price: 2222",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Total Price: 5555",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 8,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return UpdateProductDialog(
                                    nameController: _productNameController,
                                    codeController: _productCodeController,
                                    imageController: _productImageController,
                                    qtyController: _productQtyController,
                                    unitPriceController:
                                        _productUnitPriceController,
                                    totalPriceController:
                                        _productTotalPriceController,
                                    onUpdatePressed: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Are you sure for delete?"),
                                    content: Row(
                                      mainAxisAlignment: .end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("No"),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text("Yes"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
