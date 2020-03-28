import 'package:flutter/material.dart';
import 'package:happyathome/widgets/CustomColors.dart';

class ContentDetail extends StatefulWidget {
  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Content Detail Page"),
          ],
        ),
      ),
    );
  }
}
