import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happyathome/widgets/ProfileImgWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File _image;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();

  void onChooseImage(image) {
    setState(() {
      _image = image;
    });
  }

  void createUser() async {
    var name = nameController.text;
    //Todo: Save Name and Image here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("REGISTERED", true);
    Navigator.pushReplacementNamed(context, "/feeling");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Register User Page"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name'),
                ),
              ),
              ProfileImgWidget(_image, onChooseImage),
              FlatButton.icon(
                onPressed: createUser,
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
      ),
    );
  }
}
