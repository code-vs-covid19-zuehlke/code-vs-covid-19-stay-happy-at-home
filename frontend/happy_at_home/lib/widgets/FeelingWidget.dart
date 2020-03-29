import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';

class FeelingWidget extends StatelessWidget {
  final Function tapFeeling;
  final Function longPressFeeling;
  final int feelingCount;
  final Emoji feelingEmoji;

  FeelingWidget(this.feelingEmoji, this.feelingCount, this.tapFeeling,
      this.longPressFeeling);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
            onTap: () {
              tapFeeling(feelingEmoji);
            },
            onLongPress: () {
              longPressFeeling(feelingEmoji);
            },
            child: Badge(
              badgeContent: Text(
                "${feelingCount}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              showBadge: feelingCount > 0,
              position: BadgePosition.bottomRight(),
              shape: BadgeShape.square,
              borderRadius: 5,
              badgeColor: Colors.greenAccent,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              animationType: BadgeAnimationType.scale,
              child: Image(
                image: AssetImage(
                    "assets/emoji/${feelingEmoji
                        .toString()
                        .split(".")
                        .last
                        .toLowerCase()}.png"),
              ),
            )),
      ),
    );
  }
}
