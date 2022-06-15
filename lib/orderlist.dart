import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_grow_wrld/dashboard.dart';
import 'package:we_grow_wrld/foryou.dart';
import 'package:we_grow_wrld/order.dart';

List list = [];
String username = '';

class Orderlist extends StatefulWidget {
  const Orderlist({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Orderlist> {
  Future myapi(String username) async {
    if (username == null) {
      return CircularProgressIndicator();
    } else {
      var res = await http.post(Uri.parse("http://localhost/API/orderlist.php"),
          body: {"Username": username.toString()});
      setState(() {
        list = jsonDecode(res.body);
      });
    }
  }

  Future delapi(String a) async {
    try {
      var res = await http.post(Uri.parse("http://localhost/API/delcart.php"),
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

  getusername() async {
    SharedPreferences abc = await SharedPreferences.getInstance();
    setState(() {
      username = abc.getString("username").toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getusername();
    print(username.toString());
    myapi(username.toString());
  }

  @override
  Widget build(BuildContext context) {
    if (list.length.toInt() > 0) {
      var data = list[0]['Data'];
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          leading: InkWell(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          title: const Text("Your Order List"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                height: 120,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.green,
                          offset: Offset(0, 4),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(9)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]["Product_Name"],
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Rs: " + data[index]["Price"],
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Quantity: " + data[index]["Quantity"],
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Total Amount: " + data[index]["Total_amnt"],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      child: Image.network(
                        data[index]["Image_URL"],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: const Icon(Icons.cancel),
                        onTap: () {
                          delapi(data[index]["Cart_ID"].toString());
                          myapi(username.toString());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
