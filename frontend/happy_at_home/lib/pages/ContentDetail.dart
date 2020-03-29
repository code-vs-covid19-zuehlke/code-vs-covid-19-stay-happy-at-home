import 'package:flutter/material.dart';
import 'package:happyathome/widgets/BottomBarWidget.dart';
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
      bottomNavigationBar: ContentDetailBottomBar(),
    );
  }
}

class ContentDetailBottomBar extends StatelessWidget {
  const ContentDetailBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "00:24:30",
                style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black,
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
