import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/Reaction.dart';

//Todo: This content should be loaded dynamically
class PostRatingWidget extends StatelessWidget {
  final BuildContext context;
  final dynamic reactions;
  final Post post;
  final bool showAdd;

  PostRatingWidget(this.context, this.reactions, this.post, this.showAdd);

  void showReactions() {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new ListView(
                children: Emoji.values.map((emoji) {
                  return new ListTile(
                      leading: Image(
                        image: AssetImage(
                            "assets/emoji/${emoji
                                .toString()
                                .split(".")
                                .last
                                .toLowerCase()}.png"),
                      ),
                      onTap: () async {
                        addReaction(emoji);
                        Navigator.pop(context);
                      });
                }).toList()),
          );
        });
  }

  void addReaction(Emoji reaction) async {
    await Backend.postReactionToPost(
        post, Reaction(reaction));
  }

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
              onTap: showReactions,
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
