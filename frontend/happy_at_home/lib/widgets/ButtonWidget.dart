import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPress;
  final String title;

  ButtonWidget({this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
                onPressed: onPress,
                child: Text(
                  "$title",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
