import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name: Asus",
                        style: TextStyle(fontSize: 24, fontWeight: .w700),
                      ),
                      Text(
                        "Product Code: #3291",
                        style: TextStyle(fontSize: 18, fontWeight: .w700),
                      ),
                      Text(
                        "Image: image",
                        style: TextStyle(fontSize: 18, fontWeight: .w700),
                      ),
                      Text(
                        "Qty: 11",
                        style: TextStyle(fontSize: 18, fontWeight: .w700),
                      ),
                      Text(
                        "Unit Price: 2222",
                        style: TextStyle(fontSize: 18, fontWeight: .w700),
                      ),
                      Text(
                        "Total Price: 5555",
                        style: TextStyle(fontSize: 18, fontWeight: .w700),
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
