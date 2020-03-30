import 'package:flutter/material.dart';
import 'package:happyathome/models/Feeling.dart';
import 'package:happyathome/models/User.dart';
import 'package:happyathome/utils/GoogleCloudImage.dart';

import 'EmojiImage.dart';

class NewUserWidget extends StatelessWidget {
  final User user;
  final double width;

  NewUserWidget(this.user, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: GoogleCloudImage.get(user.photo),
          ),
          Text(
            user.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getFeelingsOfUser()),
        ],
      ),
    );
  }

  List<Widget> getFeelingsOfUser() {
    List<Widget> widgetList = List();
    var feelings = user.feelings;
    for (Feeling feeling in feelings) {
      widgetList.add(Container(
        height: 13,
        child: Row(
          children: <Widget>[
            EmojiImage(feeling.emoji),
          ],
        ),
      ));
    }
    return widgetList;
  }
}
