import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_grow_wrld/dashboard.dart';
import 'package:we_grow_wrld/forgotpassword.dart';
import 'package:we_grow_wrld/signup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _show = false;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  List list = [];
  String err = "";
  String confirm = "false";
  String username = '';

  Future Login() async {
    var res = await http.post(
      Uri.parse("http://localhost/API/login.php"),
      body: {'Username': name.text, 'Password': password.text},
    );
    setState(
      () {
        list = jsonDecode(res.body);
        print(list);
      },
    );
  }

  loginSetData() async {
    SharedPreferences abc = await SharedPreferences.getInstance();
    abc.setString('username', name.text);
    setState(() {
      username = abc.getString("username").toString();
    });

    if (username == "") {
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    }
  }

  logincheck() async {
    SharedPreferences abc = await SharedPreferences.getInstance();

    username = abc.getString("username").toString();

    if (username == "") {
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Login();
    logincheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Image.asset("pictures/logo.jpg")),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter Your Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Container(
                  height: 40,
                ),
                TextField(
                  controller: password,
                  obscureText: _show ? false : true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _show = !_show;
                        });
                      },
                      icon: Icon(
                          _show ? Icons.remove_red_eye : Icons.visibility_off),
                    ),
                    labelText: "Password",
                    hintText: "Enter Your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 280),
                  child: InkWell(
                    onTap: () {},
                    child: const Text("WE GRW WRLD",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      err.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text("Login"),
                            ),
                            onPressed: () {
                              if (list.length > 0) {
                                for (int i = 0; i < list.length; i++) {
                                  if (list[i]['Username'] == name.text &&
                                      list[i]['Password'] == password.text) {
                                    loginSetData();
                                  } else {
                                    setState(
                                      () {
                                        err = "Incorrect Username or Password";
                                      },
                                    );
                                    confirm = "false";
                                  }
                                }
                              }
                            }),
                      ),
                      Container(
                        height: 50,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("Signup"),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
