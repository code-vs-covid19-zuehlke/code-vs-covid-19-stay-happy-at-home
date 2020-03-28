import 'package:flutter/material.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/PostWidget.dart';

class ContentFeed extends StatefulWidget {
  @override
  _ContentFeedState createState() => _ContentFeedState();
}

class _ContentFeedState extends State<ContentFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Content Feed Page"),
            PostWidget(
                "Toilet paper tower wanted!", "Where to store all the rolls?",
                null),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/detail");
              },
              label: Text(
                "Go to Content Detail page",
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
            )
          ],
        ),
      ),
    );
  }
}
