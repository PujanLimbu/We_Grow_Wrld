import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/cart.dart';

class Details extends StatefulWidget {
  final String? proid;
  final String? name;
  final String? price;
  final String? url;
  final String? description;
  final String? recommendation;
  final String? username;
  final String? pname;
  const Details({
    Key? key,
    this.proid,
    this.name,
    this.price,
    this.url,
    this.description,
    this.recommendation,
    this.username,
    this.pname,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List list = [];
  String username1 = '';
  int quantity = 1;
  String msg = "";
  String proid = "";
  String pname = "";
  String price = "";
  String status = "";
  String ostatus = "";

  // Future Cart() async {
  //   var res = await http.post(
  //     Uri.parse("http://localhost/API/cart.php"),
  //     body: {
  //       'Username': username.toString(),
  //       'Quantity': quantity.toInt(),
  //       'Rate': widget.price.toString(),
  //       'Status': "Cart",
  //       'Product_ID': widget.proid.toString()
  //     },
  //   );

  //   setState(
  //     () {
  //       list = jsonDecode(res.body);
  //       print(list);
  //     },
  //   );
  // }

  Future Cartdata() async {
    var res = await http.post(
      Uri.parse("http://localhost/API/cart.php"),
      body: {
        'Product_ID': widget.proid.toString(),
        'Product_Name': widget.name.toString(),
        'Username': widget.username.toString(),
        'Rate': widget.price,
        'quantity': quantity,
        'Status': 'cart',
        'Order_Status': 'pending',
      },
    );

    setState(
      () {
        list = jsonDecode(res.body);
      },
    );
    return true;
  }

  @override
  void initState() {
    super.initState();
    proid = widget.proid.toString();
    username1 = widget.username.toString();
    pname = widget.name.toString();
    price = widget.price.toString();
    print(widget.username);
    print(widget.name);
    print(widget.price);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.url.toString()),
            ListTile(
              title: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.name.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRect(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Text(widget.description.toString()))
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Recommendation: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            widget.recommendation.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Rs: " + widget.price.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              Text(quantity.toString()),
                              InkWell(
                                child: const Icon(Icons.add),
                                onTap: () {
                                  setState(() {
                                    if (quantity < 10) {
                                      quantity++;
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                          TextButton.icon(
                              style:
                                  TextButton.styleFrom(primary: Colors.green),
                              onPressed: () {
                                if (Cartdata() == true) {
                                  setState(() {
                                    msg = "Add Successfully";
                                  });
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Cart(),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.shopping_cart_outlined),
                              label: const Text("Add to Cart")),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(msg.toString()),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
