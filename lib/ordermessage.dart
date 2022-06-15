import 'package:flutter/material.dart';
import 'package:we_grow_wrld/orderlist.dart';

class Omessage extends StatefulWidget {
  const Omessage({Key? key}) : super(key: key);

  @override
  State<Omessage> createState() => _OmessageState();
}

class _OmessageState extends State<Omessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text("Your Order Has Been Placed Successfully! :)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Orderlist()));
                },
                child: const Text(
                  "Go to Order Your List",
                  style: TextStyle(fontSize: 15, color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
