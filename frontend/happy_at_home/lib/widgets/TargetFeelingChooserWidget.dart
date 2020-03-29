import 'package:flutter/material.dart';
import 'package:happyathome/models/Emotion.dart';

class TargetFeelingChooserWidget extends StatefulWidget {
  final Function updateTargetFeelings;


  TargetFeelingChooserWidget(this.updateTargetFeelings);

  @override
  _TargetFeelingChooserWidgetState createState() =>
      _TargetFeelingChooserWidgetState(updateTargetFeelings);
}

class _TargetFeelingChooserWidgetState
    extends State<TargetFeelingChooserWidget> {
  List<Emotion> chosenFeelings = List();
  final Function updateTargetFeelings;

  _TargetFeelingChooserWidgetState(this.updateTargetFeelings);

  void toggleFeeling(feeling, checked) {
    setState(() {
      if (checked) {
        if (chosenFeelings.length < 3) {
          chosenFeelings.add(feeling);
        }
      } else {
        chosenFeelings.remove(feeling);
      }
    });
    updateTargetFeelings(chosenFeelings);
  }

  bool isChecked(feeling) {
    return chosenFeelings.contains(feeling);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TargetFeelingItem("Happy =D", Emotion.HAPPY,
            isChecked(Emotion.HAPPY), toggleFeeling),
        TargetFeelingItem("Relaxed", Emotion.RELAXED,
            isChecked(Emotion.RELAXED), toggleFeeling),
        TargetFeelingItem("Accomplished", Emotion.ACCOMPLISHED,
            isChecked(Emotion.ACCOMPLISHED), toggleFeeling),
        TargetFeelingItem("Informed", Emotion.INFORMED,
            isChecked(Emotion.INFORMED), toggleFeeling),
        TargetFeelingItem("Energized", Emotion.ENERGIZED,
            isChecked(Emotion.ENERGIZED), toggleFeeling),
        TargetFeelingItem("Inspired", Emotion.INSPIRED,
            isChecked(Emotion.INSPIRED), toggleFeeling),
        TargetFeelingItem("Entertained", Emotion.ENTERTAINED,
            isChecked(Emotion.ENTERTAINED), toggleFeeling),
      ],
    );
  }
}

class TargetFeelingItem extends StatelessWidget {
  final String title;
  final Emotion feeling;
  final bool checked;
  final Function toggleFeeling;

  TargetFeelingItem(this.title, this.feeling, this.checked, this.toggleFeeling);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
        ),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: checked,
                onChanged: (isChecked) {
                  toggleFeeling(feeling, isChecked);
                },
              ),
              Text(
                "$title",
                style: TextStyle(fontSize: 30, fontFamily: "Comfortaa"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
