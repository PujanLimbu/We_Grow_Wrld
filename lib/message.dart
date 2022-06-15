import 'package:flutter/material.dart';
import 'package:we_grow_wrld/login.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              "Your Account has Been Created Sucessfully! :)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text(
                "Go Back",
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
