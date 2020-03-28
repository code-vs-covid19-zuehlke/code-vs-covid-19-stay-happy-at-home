import 'package:flutter/material.dart';

//Todo: This content should be loaded dynamically
class PostRatingWidget extends StatelessWidget {
  final dynamic reactions;

  PostRatingWidget(this.reactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(image: AssetImage("assets/emoji/pile_of_poo.png")),
          Text(
            "27",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Image(
            image: AssetImage("assets/emoji/drooling_face.png"),
          ),
          Text(
            "7",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}