import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/Reaction.dart';

//Todo: This content should be loaded dynamically
class PostRatingWidget extends StatelessWidget {
  final dynamic reactions;
  final Post post;
  final bool showAdd;

  PostRatingWidget(this.reactions, this.post, this.showAdd);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
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
          ),
          SizedBox(width: 10),
          if (showAdd == true)
            InkWell(
              onTap: () async {
                await Backend.postReactionToPost(
                    post, Reaction(Emoji.EXPLODING_HEAD));
              },
              child: Container(
                color: Colors.black,
                width: 30,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
