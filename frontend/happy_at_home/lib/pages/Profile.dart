import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
        ],
      )),
    );
  }
}
