import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/User.dart';
import 'package:happyathome/widgets/ProfileImgWidget.dart';
import 'package:happyathome/widgets/UserWidget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<User> futureUser;
  File _image;

  @override
  void initState() {
    super.initState();
  }

  void onChooseImage(image) {
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Profile Page"),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/feeling");
                },
                label: Text(
                  "Go to Feeling page",
                ),
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/create");
                },
                label: Text(
                  "Create Content",
                ),
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              FlatButton.icon(
                onPressed: () {
                  setState(() {
                    futureUser = Backend.fetchUser(Random().nextInt(5) + 1);
                  });
                },
                label: Text(
                  "Fetch user",
                ),
                icon: Icon(
                  Icons.file_download,
                  color: Colors.blue,
                ),
              ),
              UserWidget(futureUser),
              ProfileImgWidget(_image, onChooseImage),
            ],
          ),
        ),
      ),
    );
  }
}
