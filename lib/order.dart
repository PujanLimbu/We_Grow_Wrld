import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/ordermessage.dart';

final Uri _url = Uri.parse('https://esewa.com.np/#/home');
List list = [];

class Order extends StatefulWidget {
  final String? pid;
  const Order({
    Key? key,
    this.pid,
  }) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Future upapi(String a) async {
    try {
      var res = await http.post(
          Uri.parse("http://localhost/API/orderconfirm.php"),
          body: {"Cart_ID": a});

      setState(() {
        list = jsonDecode(res.body);
      });

      print(a.toString());
      // print(list);
    } catch (e) {
      print(a.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Order Placement"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                upapi(widget.pid.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Omessage()));
              },
              child: const Text("Cash on Delivery"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: _launchUrl,
              child: Text("Online Payment"),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
