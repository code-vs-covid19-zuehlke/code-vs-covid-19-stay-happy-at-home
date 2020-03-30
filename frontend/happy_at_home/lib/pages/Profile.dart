import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/ReactionSummary.dart';
import 'package:happyathome/models/User.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/BottomBarWidget.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/EmojiImage.dart';
import 'package:happyathome/widgets/TimerWidget.dart';
import 'package:happyathome/widgets/UserWidget.dart';

import '../UserState.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<User> futureUser;
  ReactionSummary reactionSummaryReceived;
  ReactionSummary reactionSummaryGiven;

  @override
  void initState() {
    super.initState();
    futureUser = Backend.getUserById(UserState().user.id);
    loadReceivedReactions();
    loadGivenReactions();
  }

  void loadReceivedReactions() async {
    ReactionSummary reactionSummaryReceived =
    await Backend.getReactionSummaryReceived();
    setState(() {
      this.reactionSummaryReceived = reactionSummaryReceived;
    });
  }

  void loadGivenReactions() async {
    ReactionSummary reactionSummaryGiven =
    await Backend.getReactionSummaryGiven();
    setState(() {
      this.reactionSummaryGiven = reactionSummaryGiven;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  UserWidget(futureUser),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Reactions received",
                              style: TextStyle(
                                  fontSize: 24, fontFamily: "Comfortaa")),
                          Row(
                            children: getReactions(reactionSummaryReceived),
                          ),
                          SizedBox(height: 32),
                          Text("Reactions given",
                              style: TextStyle(
                                  fontSize: 24, fontFamily: "Comfortaa")),
                          Row(
                            children: getReactions(reactionSummaryGiven),
                          )
                        ],
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () => _refresh(),
                    label: Text(
                      "Refresh",
                      style: TextStyle(fontFamily: "Comfortaa"),
                    ),
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.blue,
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () => UserRegistration.unregister(context),
                    label: Text(
                      "Unregister",
                      style: TextStyle(fontFamily: "Comfortaa"),
                    ),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ProfileBottomBar(),
    );
  }

  void _refresh() async {
    setState(() {
      futureUser = Backend.getUserById(UserState().user.id);
      loadReceivedReactions();
    });
  }

  List<Widget> getReactions(ReactionSummary reactionSummary) {
    List<Widget> widgetList = List();
    if (reactionSummary != null) {
      reactionSummary.reactions.forEach((emoji, count) {
        widgetList.add(Container(
            child: Row(children: <Widget>[
              EmojiImage.ScaledEmojiImage(emoji, 5),
              Text(count.toString()),
              SizedBox(width: 10),
            ])));
      });
    }
    return widgetList;
  }
}

class ProfileBottomBar extends StatelessWidget {
  const ProfileBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TimerWidget(),
              Text(
                "Add more time...",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
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
