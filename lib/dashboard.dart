import 'package:flutter/material.dart';
import 'package:we_grow_wrld/course.dart';
import 'package:we_grow_wrld/equipment.dart';
import 'package:we_grow_wrld/fertilizer.dart';
import 'package:we_grow_wrld/foryou.dart';
import 'package:we_grow_wrld/cart.dart';
import 'package:we_grow_wrld/login.dart';
import 'package:we_grow_wrld/orderlist.dart';
import 'package:we_grow_wrld/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

List list = [];

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  loginSetData1() async {
    SharedPreferences abc = await SharedPreferences.getInstance();
    abc.setString('username', '');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    child: Image.asset(
                  "pictures/logo.jpg",
                )),
                ListTile(
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Course"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Course()));
                  },
                ),
                ListTile(
                  title: const Text("Fertilizers"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Fertilizer()));
                  },
                ),
                ListTile(
                  title: const Text("Equipments"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Equipment()));
                  },
                ),
                ListTile(
                  title: const Text("Order List"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Orderlist()));
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text("We Grow Wrld"),
            centerTitle: true,
            backgroundColor: Colors.green,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'For You',
                ),
                Tab(text: 'Course'),
              ],
            ),
            actions: [
              // IconButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const Profile()));
              //     },
              //     icon: const Icon(Icons.person_rounded)),
              IconButton(
                  onPressed: () {
                    loginSetData1();
                  },
                  icon: const Icon(Icons.logout)),
            ],
          ),
          body: const Myapi(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      );
}

class Myapi extends StatefulWidget {
  const Myapi({Key? key}) : super(key: key);

  @override
  State<Myapi> createState() => _MyapiState();
}

class _MyapiState extends State<Myapi> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [Foryou(), Course()],
    );
  }
}
