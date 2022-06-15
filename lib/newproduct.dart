import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/details.dart';
import 'package:we_grow_wrld/adcart.dart';

List list = [];

class Newproduct extends StatefulWidget {
  const Newproduct({Key? key}) : super(key: key);

  @override
  State<Newproduct> createState() => _NewproductState();
}

class _NewproductState extends State<Newproduct> {
  Future myapi() async {
    var res = await http.get(Uri.parse("http://localhost/API/product.php"));

    setState(() {
      list = jsonDecode(res.body);
    });
    print(list);
  }

  @override
  void initState() {
    super.initState();
    myapi();
  }

  @override
  Widget build(BuildContext context) {
    if (list.length.toInt() > 0) {
      var nproduct = list[0]['Newproduct'];
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          leading: InkWell(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("New & Updated Products"),
        ),
        body: ListView.builder(
          itemCount: nproduct.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Test(
                                pid: nproduct[index]["Product_ID"],
                                pname: nproduct[index]["Product_Name"],
                                price: nproduct[index]["Product_Price"],
                                url: nproduct[index]["Image_URL"],
                                description: nproduct[index]["Description"],
                                recommendation: nproduct[index]
                                    ["Recommendation"],
                              )));
                },
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
                      ClipRRect(
                        child: Image.network(
                          nproduct[index]["Image_URL"],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nproduct[index]["Product_Name"],
                                style: const TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Rs: " + nproduct[index]["Product_Price"],
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
