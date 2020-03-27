import 'package:flutter/material.dart';

class CreateContent extends StatefulWidget {
  @override
  _CreateContentState createState() => _CreateContentState();
}

class _CreateContentState extends State<CreateContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Create Content Page"),
          ],
        ),
      ),
    );
  }
}
