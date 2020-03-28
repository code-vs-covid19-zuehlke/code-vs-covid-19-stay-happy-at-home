import 'package:flutter/material.dart';

import '../UserState.dart';

class ActualFeeling extends StatefulWidget {
  @override
  _ActualFeelingState createState() => _ActualFeelingState();
}

class _ActualFeelingState extends State<ActualFeeling> {
  final userstate = UserState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Actual Feeling Page"),
              Text("Hello ${userstate.user.name}\nHow do you feel?"),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/feed");
                },
                label: Text(
                  "Go to Feed",
                ),
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/profile");
                },
                label: Text(
                  "Go to Profile",
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
