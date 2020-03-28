import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/Feeling.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/CustomColors.dart';
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

  void uploadFeelings() {
    var feelings = chosenFeelings.map((emoji) => Feeling(emoji: emoji)).toSet();
    Backend.setFeelings(UserState().user, feelings);
    Navigator.pushNamed(context, "/feed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
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
                  onPressed: uploadFeelings,
                  label: Text(
                    "Go to Feed",
                    style: TextStyle(
                        fontFamily: "Comfortaa"
                    ),
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
                    style: TextStyle(
                        fontFamily: "Comfortaa"
                    ),
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
