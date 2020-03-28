import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  String title;
  Widget child;

  TitleCard({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 25,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
