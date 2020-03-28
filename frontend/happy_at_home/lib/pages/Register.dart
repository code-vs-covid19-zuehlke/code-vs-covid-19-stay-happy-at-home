import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Register User Page"),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/feeling");
              },
              label: Text(
                "Register now",
              ),
              icon: Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
