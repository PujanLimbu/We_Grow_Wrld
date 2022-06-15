import 'package:flutter/material.dart';
import 'package:we_grow_wrld/order.dart';
import 'package:we_grow_wrld/purchase.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    "https://media.istockphoto.com/vectors/user-profile-icon-vector-avatar-portrait-symbol-flat-shape-person-vector-id1270368615?k=20&m=1270368615&s=170667a&w=0&h=qpvA8Z6L164ZcKfIyOl-E8fKnfmRZ09Tks7WEoiLawA="),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 172),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text(
                          "Name:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Hency Limbu",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 210),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text(
                          "Username:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Hency07",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text(
                          "Email-Address:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Hencylimbu07@gmail.com",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 185),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text(
                          "Date of Birth:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "1995/02/07",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 225),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text(
                          "Address:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Dharan",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 100, top: 80),
                      child: Container(
                          height: 40,
                          width: 180,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Purchase()));
                              },
                              child: const Text("View Purchase History"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Container(
                          height: 40,
                          width: 180,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Order()));
                              },
                              child: const Text("Order List"))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
