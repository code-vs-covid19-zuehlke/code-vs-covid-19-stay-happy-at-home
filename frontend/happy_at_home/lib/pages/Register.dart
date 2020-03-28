import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/ProfileImgWidget.dart';

import '../UserState.dart';

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
    UserState().user = await UserRegistration.register(name);
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
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Register User Page"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter your name'),
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
