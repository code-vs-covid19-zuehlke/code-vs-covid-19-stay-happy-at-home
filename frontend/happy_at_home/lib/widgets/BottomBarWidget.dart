import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final Function buttonTapped;
  final Function profileTapped;

  BottomBarWidget(this.buttonTapped, this.profileTapped);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
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
            onPressed: buttonTapped,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Colors.black,
          ),
          InkWell(
            onTap: profileTapped,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile_picture.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
