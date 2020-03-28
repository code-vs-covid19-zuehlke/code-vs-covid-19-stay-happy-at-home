import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/FeelingChooserWidget.dart';
import 'package:happyathome/widgets/UserWidget.dart';

import '../UserState.dart';

class ActualFeeling extends StatefulWidget {
  @override
  _ActualFeelingState createState() => _ActualFeelingState();
}

class _ActualFeelingState extends State<ActualFeeling> {
  final userstate = UserState();
  List<Emoji> chosenFeelings;

  void updateFeelings(feelingList) {
    chosenFeelings = feelingList;
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
                Text("Hello, how do you feel?"),
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
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: FeelingChooserWidget(3, updateFeelings),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
