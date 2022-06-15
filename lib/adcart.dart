import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/cart.dart';

class Test extends StatefulWidget {
  final String? cartid;
  final String? pid;
  final String? price;
  final String? url;
  final String? description;
  final String? recommendation;
  final String? name;
  final String? pname;
  final String? quantity;
  const Test({
    Key? key,
    this.cartid,
    this.pid,
    this.price,
    this.url,
    this.description,
    this.recommendation,
    this.name,
    this.pname,
    this.quantity,
  }) : super(key: key);

  @override
  State<Test> createState() => _DetailsState();
}

class _DetailsState extends State<Test> {
  List list = [];
  String cartid = '';
  String name = '';
  String pid = "";
  String pname = "";
  String price = "";
  int quantity = 1;
  String msg = "";

  Future cartdata() async {
    try {
      var res = await http.post(
        Uri.parse("http://localhost/API/addcart.php"),
        body: {
          "Username": name.toString(),
          "Product_ID": pid.toString(),
          "Product_Name": pname.toString(),
          "Price": price.toString(),
          "Quantity": quantity.toString(),
        },
      );
      setState(
        () {
          list = jsonDecode(res.body);
          print(list);
          abc();
        },
      );

      return true;
    } catch (e) {
      print(e);
    }
  }

  void abc() {
    print(pid);
    print(name);
    print(pname);
    print(price);
    print(quantity);
  }

  @override
  void initState() {
    pid = widget.pid.toString();
    name = widget.name.toString();
    pname = widget.pname.toString();
    price = widget.price.toString();
    quantity = quantity;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pname.toString()),
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
                    child: Text(widget.pname.toString()),
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
                      ),
                    ),
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
                            ),
                          ],
                        ),
                        TextButton.icon(
                            style: TextButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              cartdata();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Cart(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart_outlined),
                            label: const Text("Add to Cart")),
                      ],
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
