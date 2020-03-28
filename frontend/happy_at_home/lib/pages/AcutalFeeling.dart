import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/FeelingChooserWidget.dart';
import 'package:happyathome/widgets/StyledSlider.dart';
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
                Text("How much time do you want to invest?"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StyledSlider(timePeriod, updateTimePeriod),
                ),
                Text("Hello, how do you feel?"),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: FeelingChooserWidget(3, updateFeelings),
                ),
                FlatButton.icon(
                  onPressed: () {
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
