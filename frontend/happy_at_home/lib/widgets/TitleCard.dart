import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  String title;
  String subtitle;
  Widget child;

  TitleCard({this.title, this.child, this.subtitle});

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
        padding: const EdgeInsets.all(34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 30,
                  fontFamily: "Comfortaa"),
              textAlign: TextAlign.left,
            ),
            if (subtitle != null)
              Text(
                subtitle,
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
