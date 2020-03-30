import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/Reply.dart';

import 'EmojiImage.dart';

//Todo: This content should be loaded dynamically
class PostRatingWidget extends StatelessWidget {
  final BuildContext context;
  final Reply reply;
  final Post post;
  final bool showAdd;
  final bool isReply;
  final Function addReaction;

  PostRatingWidget(this.context, this.reply, this.post, this.showAdd,
      this.isReply, this.addReaction);

  void showReactions() {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                children: Emoji.values.map((emoji) {
                  return InkWell(
                      child: EmojiImage(emoji),
                      onTap: () async {
                        addReaction(post, reply, emoji, isReply);
                        Navigator.pop(context);
                      });
                }).toList()),
          );
        });
  }

  List<Widget> getContent() {
    List<Widget> widgetList = List();
    if (isReply) {
      reply.reactionSummary.reactions.forEach((emoji, count) {
        widgetList.add(Container(
          height: 25,
          child: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    if (addReaction != null) {
                      addReaction(
                          post,
                          reply,
                          EnumToString.fromString(Emoji.values, emoji),
                          isReply);
                    }
                  },
                  child:
                  EmojiImage(EnumToString.fromString(Emoji.values, emoji))),
              Text(
                count.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ));
      });
    } else {
      post.reactionSummary.reactions.forEach((emoji, count) {
        widgetList.add(Container(
          height: 25,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (addReaction != null) {
                    addReaction(post, reply,
                        EnumToString.fromString(Emoji.values, emoji), isReply);
                  }
                },
                child: EmojiImage(EnumToString.fromString(Emoji.values, emoji)),
              ),
              Text(
                count.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ));
      });
    }

    if (showAdd) {
      widgetList.add(
        Container(
          child: InkWell(
            onTap: showReactions,
            child: Container(
              color: Colors.black,
              width: 40,
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
