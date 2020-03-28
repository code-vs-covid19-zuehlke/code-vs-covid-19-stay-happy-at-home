import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FeelingWidget extends StatelessWidget {
  final Function tapFeeling;
  final Function longPressFeeling;
  final int feelingCount;
  final String feelingName;

  FeelingWidget(this.feelingName, this.feelingCount, this.tapFeeling,
      this.longPressFeeling);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
            onTap: () {
              tapFeeling(feelingName);
            },
            onLongPress: () {
              longPressFeeling(feelingName);
            },
            child: Badge(
              badgeContent: Text("${feelingCount}"),
              showBadge: feelingCount > 0,
              child: Image(
                image: AssetImage("assets/emoji/${feelingName}.png"),
              ),
            )),
      ),
    );
  }
}
