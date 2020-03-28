import 'package:flutter/material.dart';

class TargetFeelingChooserWidget extends StatefulWidget {
  @override
  _TargetFeelingChooserWidgetState createState() =>
      _TargetFeelingChooserWidgetState();
}

class _TargetFeelingChooserWidgetState
    extends State<TargetFeelingChooserWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //Todo: create a widget for this part
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (isChecked) {},
                ),
                Text(
                  "Happy =D",
                  style: TextStyle(fontSize: 30, fontFamily: "Comfortaa"),
                )
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: false,
              onChanged: (isChecked) {},
            ),
            Text(
              "Relaxed",
              style: TextStyle(fontSize: 30, fontFamily: "Comfortaa"),
            )
          ],
        ),
      ],
    );
  }
}
