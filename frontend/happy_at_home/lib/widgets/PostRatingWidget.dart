import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/Reaction.dart';

import 'EmojiImage.dart';

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
                      leading: EmojiImage(emoji),
                      onTap: () async {
                        addReaction(emoji);
                        Navigator.pop(context);
                      });
                }).toList()),
          );
        });
  }

  void addReaction(Emoji reaction) async {
    await Backend.postReactionToPost(post, Reaction(reaction));
  }

  List<Widget> getContent() {
    List<Widget> widgetList = List();

    for (Reaction reaction in post.postReactions) {
      widgetList.add(Container(
        height: 25,
        child: Row(
          children: <Widget>[
            EmojiImage(reaction.emoji),
            Text(
              "1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10,)
          ],
        ),
      ));
    }
    if (showAdd) {
      widgetList.add(
        Container(
          child: InkWell(
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
        ),
      );
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start, children: getContent());
  }
}
