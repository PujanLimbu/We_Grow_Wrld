import 'package:flutter/material.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Purchase History"),
        centerTitle: true,
      ),
    );
  }
}
