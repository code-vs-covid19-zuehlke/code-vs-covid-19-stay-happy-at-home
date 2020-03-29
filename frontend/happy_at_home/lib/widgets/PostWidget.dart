import 'package:flutter/material.dart';
import 'package:happyathome/widgets/PostRatingWidget.dart';

class PostWidget extends StatelessWidget {
  final String title;
  final String description;
  final dynamic reactions;
  final Function postSelected;

  //Todo: replace with post
  PostWidget(this.title, this.description, this.reactions, this.postSelected);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Todo: Replace with ID
        postSelected(title);
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            PostImage(7),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("$description"),
                PostRatingWidget(reactions),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  final int duration;

  PostImage(this.duration);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage("assets/profile_picture.jpg"),
          radius: 45,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "${duration} MIN",
              style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
