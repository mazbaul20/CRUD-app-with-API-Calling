import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../data/model/product_model.dart';
import '../widgets/product_info.dart';
import '../widgets/update_product_dialog.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Client http = Client();
  ProductModel productModel = ProductModel();
  bool isLoading = false;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productQtyController = TextEditingController();
  final TextEditingController _productUnitPriceController =
      TextEditingController();
  final TextEditingController _productTotalPriceController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  void getAllProducts() async {
    isLoading = true;
    setState(() {});
    Uri uri = Uri.parse(
      'https://crud-api-ostad-live.onrender.com/api/v1/ReadProduct',
    );
    Response response = await http.get(uri);
    productModel = ProductModel.fromJson(jsonDecode(response.body));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                shrinkWrap: true,
                itemCount: productModel.data!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 390,
                    width: double.infinity,
                    child: Card(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductInfo(
                              productTitle:
                                  "Product Name: ${productModel.data?[index].productName}",
                              fontSize: 24,
                              fontWeight: .w700,
                            ),
                            ProductInfo(
                              productTitle:
                                  "Product Code ${productModel.data?[index].productCode}",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            ProductInfo(
                              productTitle:
                                  "Image: ${productModel.data?[index].img}",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            ProductInfo(
                              productTitle:
                                  "Qty: ${productModel.data?[index].qty}",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            ProductInfo(
                              productTitle:
                                  "Unit Price: ${productModel.data?[index].unitPrice}",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            ProductInfo(
                              productTitle:
                                  "Total Price: ${productModel.data?[index].totalPrice}",
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
                                          nameController:
                                              _productNameController,
                                          codeController:
                                              _productCodeController,
                                          imageController:
                                              _productImageController,
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
                                          title: Text(
                                            "Are you sure for delete?",
                                          ),
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
                  );
                },
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
