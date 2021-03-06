import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';

import 'FeelingWidget.dart';

class EmojiChooserWidget extends StatefulWidget {
  final int maxFeelings;
  final bool multiChoose;
  final Function updateFeelings;

  @override
  _EmojiChooserWidgetState createState() =>
      _EmojiChooserWidgetState(maxFeelings, updateFeelings, multiChoose);

  EmojiChooserWidget(this.maxFeelings, this.updateFeelings, this.multiChoose);
}

class _EmojiChooserWidgetState extends State<EmojiChooserWidget> {
  var addedFeelings = new List<Emoji>();
  var maxFeelings = 0;
  bool multiChoose;
  final Function updateFeelings;

  _EmojiChooserWidgetState(this.maxFeelings, this.updateFeelings,
      this.multiChoose);

  void addFeelingToList(feeling) {
    if (!this.addedFeelings.contains(feeling) || multiChoose) {
      if (this.addedFeelings.length < maxFeelings) {
        setState(() {
          addedFeelings.add(feeling);
        });
        updateFeelings(addedFeelings);
      }
    }
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
            FeelingWidget(
                Emoji.THINKING_FACE,
                getBadgeCount(Emoji.THINKING_FACE),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.GRINNING_FACE_WITH_SMILING_EYES,
                getBadgeCount(Emoji.GRINNING_FACE_WITH_SMILING_EYES),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.SMILING_FACE_WITH_HEART_EYES,
                getBadgeCount(Emoji.SMILING_FACE_WITH_HEART_EYES),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.HEAR_NO_EVIL_MONKEY,
                getBadgeCount(Emoji.HEAR_NO_EVIL_MONKEY),
                addFeelingToList,
                removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget(
                Emoji.UNAMUSED_FACE,
                getBadgeCount(Emoji.UNAMUSED_FACE),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.DROOLING_FACE,
                getBadgeCount(Emoji.DROOLING_FACE),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.LOUDLY_CRYING_FACE,
                getBadgeCount(Emoji.LOUDLY_CRYING_FACE),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.SLEEPING_FACE,
                getBadgeCount(Emoji.SLEEPING_FACE),
                addFeelingToList,
                removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget(Emoji.YAWNING_FACE, getBadgeCount(Emoji.YAWNING_FACE),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget(
                Emoji.FACE_WITH_TEARS_OF_JOY,
                getBadgeCount(Emoji.FACE_WITH_TEARS_OF_JOY),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.DOWNCAST_FACE_WITH_SWEAT,
                getBadgeCount(Emoji.DOWNCAST_FACE_WITH_SWEAT),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(Emoji.POUTING_FACE, getBadgeCount(Emoji.POUTING_FACE),
                addFeelingToList, removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget(Emoji.PILE_OF_POO, getBadgeCount(Emoji.PILE_OF_POO),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget(Emoji.NERD_FACE, getBadgeCount(Emoji.NERD_FACE),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget(
                Emoji.FACE_WITH_MEDICAL_MASK,
                getBadgeCount(Emoji.FACE_WITH_MEDICAL_MASK),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.FACE_SCREAMING_IN_FEAR,
                getBadgeCount(Emoji.FACE_SCREAMING_IN_FEAR),
                addFeelingToList,
                removeFeelingFromList),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FeelingWidget(Emoji.PANDA, getBadgeCount(Emoji.PANDA),
                addFeelingToList, removeFeelingFromList),
            FeelingWidget(
                Emoji.PERSON_IN_LOTUS_POSITION,
                getBadgeCount(Emoji.PERSON_IN_LOTUS_POSITION),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.PERSON_LIFTING_WEIGHTS,
                getBadgeCount(Emoji.PERSON_LIFTING_WEIGHTS),
                addFeelingToList,
                removeFeelingFromList),
            FeelingWidget(
                Emoji.EXPLODING_HEAD,
                getBadgeCount(Emoji.EXPLODING_HEAD),
                addFeelingToList,
                removeFeelingFromList),
          ],
        ),
      ],
    );
  }
}
