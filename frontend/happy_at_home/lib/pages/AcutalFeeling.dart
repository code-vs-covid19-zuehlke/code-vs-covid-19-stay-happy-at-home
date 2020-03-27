import 'package:flutter/material.dart';

class ActualFeeling extends StatefulWidget {
  @override
  _ActualFeelingState createState() => _ActualFeelingState();
}

class _ActualFeelingState extends State<ActualFeeling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Actual Feeling Page"),
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
            )
          ],
        ),
      ),
    );
  }
}
