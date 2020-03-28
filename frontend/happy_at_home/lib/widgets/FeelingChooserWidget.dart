import 'package:flutter/material.dart';

import 'FeelingWidget.dart';

class FeelingChooserWidget extends StatefulWidget {
  var maxFeelings = 0;
  final Function updateFeelings;

  @override
  _FeelingChooserWidgetState createState() =>
      _FeelingChooserWidgetState(maxFeelings, updateFeelings);

  FeelingChooserWidget(this.maxFeelings, this.updateFeelings);
}

class _FeelingChooserWidgetState extends State<FeelingChooserWidget> {
  var addedFeelings = new List<String>();
  var maxFeelings = 0;
  final Function updateFeelings;

  _FeelingChooserWidgetState(this.maxFeelings, this.updateFeelings);

  void addFeelingToList(feeling) {
    setState(() {
      if (this.addedFeelings.length < maxFeelings) {
        addedFeelings.add(feeling);
      }
    });
    updateFeelings(addedFeelings);
  }

  void removeFeelingFromList(feeling) {
    setState(() {
      addedFeelings.remove(feeling);
    });
    updateFeelings(addedFeelings);
  }

  int getBadgeCount(feeling) {
    return addedFeelings.where((f) => f == feeling).length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget("thinking_face", getBadgeCount("thinking_face"),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget("smiling", getBadgeCount("smiling"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("heart-eyes", getBadgeCount("heart-eyes"),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget("monkey", getBadgeCount("monkey"), addFeelingToList,
                removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget("unamused", getBadgeCount("unamused"),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget("drool", getBadgeCount("drool"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("crying", getBadgeCount("crying"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("sleepy", getBadgeCount("sleepy"), addFeelingToList,
                removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget("yawning", getBadgeCount("yawning"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("laughing", getBadgeCount("laughing"),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget("cold_sweat", getBadgeCount("cold_sweat"),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget("angry", getBadgeCount("angry"), addFeelingToList,
                removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget("poo", getBadgeCount("poo"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("nerd-face", getBadgeCount("nerd-face"),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget("medical_mask", getBadgeCount("medical_mask"),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget("screaming", getBadgeCount("screaming"),
                addFeelingToList, removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget("panda", getBadgeCount("panda"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("yoga", getBadgeCount("yoga"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("sports", getBadgeCount("sports"), addFeelingToList,
                removeFeelingFromList),
            FeelingWidget("exploding_head", getBadgeCount("exploding_head"),
                addFeelingToList, removeFeelingFromList),
          ],
        ),
      ],
    );
  }
}
