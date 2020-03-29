import 'package:flutter/material.dart';
import 'package:happyathome/models/TargetFeeling.dart';

class TargetFeelingChooserWidget extends StatefulWidget {
  final Function updateTargetFeelings;


  TargetFeelingChooserWidget(this.updateTargetFeelings);

  @override
  _TargetFeelingChooserWidgetState createState() =>
      _TargetFeelingChooserWidgetState(updateTargetFeelings);
}

class _TargetFeelingChooserWidgetState
    extends State<TargetFeelingChooserWidget> {
  List<TargetFeeling> chosenFeelings = List();
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
        TargetFeelingItem("Happy =D", TargetFeeling.HAPPY,
            isChecked(TargetFeeling.HAPPY), toggleFeeling),
        TargetFeelingItem("Relaxed", TargetFeeling.RELAXED,
            isChecked(TargetFeeling.RELAXED), toggleFeeling),
        TargetFeelingItem("Accomplished", TargetFeeling.ACCOMPLISHED,
            isChecked(TargetFeeling.ACCOMPLISHED), toggleFeeling),
        TargetFeelingItem("Informed", TargetFeeling.INFORMED,
            isChecked(TargetFeeling.INFORMED), toggleFeeling),
        TargetFeelingItem("Energized", TargetFeeling.ENERGIZED,
            isChecked(TargetFeeling.ENERGIZED), toggleFeeling),
        TargetFeelingItem("Inspired", TargetFeeling.INSPIRED,
            isChecked(TargetFeeling.INSPIRED), toggleFeeling),
        TargetFeelingItem("Entertained", TargetFeeling.ENTERTAINED,
            isChecked(TargetFeeling.ENTERTAINED), toggleFeeling),
      ],
    );
  }
}

class TargetFeelingItem extends StatelessWidget {
  final String title;
  final TargetFeeling feeling;
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
