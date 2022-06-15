import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_grow_wrld/message.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Create An Account"),
          centerTitle: true,
        ),
        body: const Insertdata());
  }
}

class Insertdata extends StatefulWidget {
  const Insertdata({Key? key}) : super(key: key);

  @override
  State<Insertdata> createState() => _InsertdataState();
}

class _InsertdataState extends State<Insertdata> {
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  String err = "";
  List list = [];

  Future myapi() async {
    var res =
        await http.post(Uri.parse("http://localhost/API/post.php"), body: {
      'Username': name.text,
      'Contact': contact.text,
      'Email_Address': email.text,
      'User_Type': 'User',
      'Address': address.text,
      'Password': password.text
    });
    setState(() {
      list = jsonDecode(res.body);
      print(list);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: Container(
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: contact,
                          decoration: InputDecoration(
                            hintText: 'Contact',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email-Address',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: address,
                          decoration: InputDecoration(
                            hintText: 'Address',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: repassword,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Text(err.toString()),
                      Container(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            child: const Text("Sign Up"),
                            onPressed: () {
                              if (password.text == repassword.text) {
                                myapi();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Message()));
                              } else {
                                print('Failed');
                                setState(() {
                                  err = "Password Dont Match";
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
