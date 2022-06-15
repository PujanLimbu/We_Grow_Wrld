import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/equipment.dart';
import 'package:we_grow_wrld/fertilizer.dart';
import 'package:we_grow_wrld/newproduct.dart';
import 'package:we_grow_wrld/recommend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_grow_wrld/adcart.dart';

List list = [];
String username = '';

class Foryou extends StatefulWidget {
  const Foryou({Key? key}) : super(key: key);

  @override
  State<Foryou> createState() => _ForyouState();
}

class _ForyouState extends State<Foryou> {
  Future myapi() async {
    try {
      var res = await http.get(Uri.parse("http://localhost/API/product.php"));

      setState(() {
        list = jsonDecode(res.body);
      });
      print(list);
    } catch (e) {
      return const Center(
        child: Text("Server is not found"),
      );
    }
  }

  getusername() async {
    SharedPreferences abc = await SharedPreferences.getInstance();
    setState(() {
      username = abc.getString("username").toString();
      print(username);
    });
  }

  @override
  void initState() {
    super.initState();
    getusername();
    myapi();
  }

  @override
  Widget build(BuildContext context) {
    {
      if (list.length > 0) {
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      var nproduct = list[0]['Newproduct'];
      var data = list[0]['Product'];
      var fertilizer = list[0]['fertilizer'];
      var equipment = list[0]['equipments'];
      return SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("Recommended For You"),
              trailing: const Icon(Icons.arrow_forward),
              hoverColor: Colors.green,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Recommend()));
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Test(
                            pid: data[index]["Product_ID"],
                            pname: data[index]["Product_Name"],
                            price: data[index]["Product_Price"],
                            url: data[index]["Image_URL"],
                            description: data[index]["Description"],
                            recommendation: data[index]["Recommendation"],
                            name: username.toString(),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        width: 200,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                data[index]['Image_URL'],
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data[index]["Product_Name"],
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "Rs: " + data[index]["Product_Price"],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: const Text("New & Updated Products"),
              trailing: const Icon(Icons.arrow_forward),
              hoverColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Newproduct(),
                  ),
                );
              },
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: nproduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        width: 200,
                        child: InkWell(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  nproduct[index]['Image_URL'],
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  nproduct[index]["Product_Name"],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Rs: " + nproduct[index]["Product_Price"],
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Test(
                                          pid: nproduct[index]["Product_ID"],
                                          pname: nproduct[index]
                                              ["Product_Name"],
                                          price: nproduct[index]
                                              ["Product_Price"],
                                          url: nproduct[index]["Image_URL"],
                                          description: nproduct[index]
                                              ["Description"],
                                          recommendation: nproduct[index]
                                              ["Recommendation"],
                                          name: username,
                                        )));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Fertilizer"),
              trailing: const Icon(Icons.arrow_forward),
              hoverColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Fertilizer(),
                  ),
                );
              },
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fertilizer.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        width: 200,
                        child: InkWell(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  fertilizer[index]['Image_URL'],
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  fertilizer[index]["Product_Name"],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Rs: " + equipment[index]["Product_Price"],
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Test(
                                          pid: fertilizer[index]["Product_ID"],
                                          pname: fertilizer[index]
                                              ["Product_Name"],
                                          price: fertilizer[index]
                                              ["Product_Price"],
                                          url: fertilizer[index]["Image_URL"],
                                          description: fertilizer[index]
                                              ["Description"],
                                          recommendation: fertilizer[index]
                                              ["Recommendation"],
                                          name: username,
                                        )));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Equipment"),
              trailing: const Icon(Icons.arrow_forward),
              hoverColor: Colors.green,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Equipment()));
              },
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: equipment.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        width: 200,
                        child: InkWell(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  equipment[index]['Image_URL'],
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  equipment[index]["Product_Name"],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Rs: " + equipment[index]["Product_Price"],
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Test(
                                          pid: equipment[index]["Product_ID"],
                                          pname: equipment[index]
                                              ["Product_Name"],
                                          price: equipment[index]
                                              ["Product_Price"],
                                          url: equipment[index]["Image_URL"],
                                          description: equipment[index]
                                              ["Description"],
                                          recommendation: equipment[index]
                                              ["Recommendation"],
                                          name: username,
                                        )));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
