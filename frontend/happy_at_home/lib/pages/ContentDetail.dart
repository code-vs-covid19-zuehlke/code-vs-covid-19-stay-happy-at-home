import 'package:flutter/material.dart';
import 'package:happyathome/widgets/BottomBarWidget.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/ImagePickerWidget.dart';
import 'package:happyathome/widgets/TitleCard.dart';

class ContentDetail extends StatefulWidget {
  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  String title = "Toilet paper towers wanted!";
  String description = "Where to store all the rolls?";
  List<String> input = ["Test 1", "Test 2", "Test 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: TitleCard(
          title: title,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 240,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("Toilet paper tower wanted!");
                  },
                ),
              ),
              ImagePickerWidget(context, null, () {}),
            ],
          ),
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
