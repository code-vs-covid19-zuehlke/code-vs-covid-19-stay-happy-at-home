import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/Feeling.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/FeelingChooserWidget.dart';
import 'package:happyathome/widgets/StyledSlider.dart';
import 'package:happyathome/widgets/TitleCard.dart';
import 'package:happyathome/widgets/UserWidget.dart';

import '../UserState.dart';

class ActualFeeling extends StatefulWidget {
  @override
  _ActualFeelingState createState() => _ActualFeelingState();
}

class _ActualFeelingState extends State<ActualFeeling> {
  final userstate = UserState();
  List<Emoji> chosenFeelings;
  double timePeriod = 15.0;

  void updateFeelings(feelingList) {
    chosenFeelings = feelingList;
  }

  void updateTimePeriod(time) {
    this.timePeriod = time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                UserWidget(UserRegistration.load()),
                TitleCard(
                  title: "How much time do you want to invest?",
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StyledSlider(timePeriod, updateTimePeriod),
                  ),
                ),
                TitleCard(
                    title: "How do you feel?",
                    child: FeelingChooserWidget(3, updateFeelings)),
                FlatButton.icon(
                  onPressed: () {
                    Backend.setFeelings(UserState().user,
                        {Feeling(emoji: Emoji.DROOLING_FACE), Feeling(emoji: Emoji.FACE_WITH_TEARS_OF_JOY)});
                    Navigator.pushNamed(context, "/feed");
                  },
                  label: Text(
                    "Go to Feed",
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/profile");
                  },
                  label: Text(
                    "Go to Profile",
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
