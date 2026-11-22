import 'package:flutter/material.dart';

import '../widgets/product_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo"), backgroundColor: Colors.blue),
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
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {},
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
    );
  }
}
