import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/coursed.dart';
import 'package:shared_preferences/shared_preferences.dart';

List list = [];
String username = '';

class Course extends StatefulWidget {
  const Course({Key? key}) : super(key: key);

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  Future myapi() async {
    var res = await http.get(Uri.parse("http://localhost/API/product.php"));

    setState(() {
      list = jsonDecode(res.body);
    });
    print(list);
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
    if (list.length.toInt() > 0) {
      var course = list[0]['course'];
      return Scaffold(
        body: ListView.builder(
          itemCount: course.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Coursed(
                                cid: course[index]["Course_ID"],
                                coursename: course[index]["Course_Name"],
                                duration: course[index]["Duration"],
                                cimage: course[index]["URL"],
                                username: username.toString(),
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
                          course[index]["URL"],
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
                                course[index]["Course_Name"],
                                style: const TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Duration: " + course[index]["Duration"],
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
