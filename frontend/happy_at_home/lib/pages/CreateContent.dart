import 'package:flutter/material.dart';
import 'package:happyathome/widgets/CustomColors.dart';

class CreateContent extends StatefulWidget {
  @override
  _CreateContentState createState() => _CreateContentState();
}

class _CreateContentState extends State<CreateContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
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
