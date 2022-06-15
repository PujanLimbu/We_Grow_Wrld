import 'package:flutter/material.dart';

class Fpassword extends StatefulWidget {
  const Fpassword({Key? key}) : super(key: key);

  @override
  _FpasswordState createState() => _FpasswordState();
}

class _FpasswordState extends State<Fpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Coming Soon :)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
