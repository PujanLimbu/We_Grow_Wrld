import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/coursebooking.dart';

class Coursed extends StatefulWidget {
  final String? coursename;
  final String? duration;
  final String? cimage;
  final String? username;
  final String? cid;
  final String? bid;
  const Coursed(
      {Key? key,
      this.coursename,
      this.duration,
      this.cimage,
      this.username,
      this.cid,
      this.bid})
      : super(key: key);

  @override
  State<Coursed> createState() => _CoursedState();
}

class _CoursedState extends State<Coursed> {
  List list = [];
  String bid = '';
  String coursename = '';
  String username = '';
  String cid = '';

  Future bdata() async {
    var res = await http.post(
      Uri.parse("http://localhost/API/bcourse.php"),
      body: {
        "Username": username.toString(),
        "Course_ID": cid.toString(),
        "Course_Name": coursename.toString(),
      },
    );
    setState(() {
      list = jsonDecode(res.body);
      print(list);
    });
  }

  @override
  void initState() {
    username = widget.username.toString();
    cid = widget.cid.toString();
    coursename = widget.coursename.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coursename.toString()),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(widget.cimage.toString()),
            ),
            ListTile(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Course Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.coursename.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Duration: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(widget.duration.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: const Text(
                            "Proceed To Booking",
                            style: TextStyle(color: Colors.green),
                          ),
                          onTap: () {
                            bdata();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Bookings()));
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
