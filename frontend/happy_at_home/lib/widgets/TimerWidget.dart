import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyathome/UserState.dart';

class TimerWidget extends StatefulWidget {
  final Function showHowAreYouAgainWidget;

  const TimerWidget(this.showHowAreYouAgainWidget);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerWidget> {
  Duration remaining;
  Timer timer;
  Function showHowAreYouAgainWidget;

  TimerWidget(Function showHowAreYouAgainWidget) {
    this.showHowAreYouAgainWidget = showHowAreYouAgainWidget;
  }

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(
        Duration(milliseconds: 500), (Timer t) => _updateRemaining());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _updateRemaining() {
    var newRemaining = Duration(milliseconds: 0);
    if (UserState().user != null) {
      newRemaining =
          UserState().user.timeRecord.getDeadline().difference(DateTime.now());
    }
    setState(() {
      remaining = newRemaining;
      if (remaining.isNegative) {
        showHowAreYouAgainWidget();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_formatDuration(remaining),
            style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: _getColor(remaining))),
      ),
    );
  }

  Color _getColor(Duration duration) {
    if (duration == null) {
      return Colors.black;
    }
    if (duration < Duration(seconds: 10)) {
      return Colors.red;
    }
    if (duration < Duration(minutes: 1)) {
      return Colors.yellow;
    }
    return Colors.black;
  }

  String _formatDuration(Duration duration) {
    if (duration == null) {
      return "??:??:??";
    }
    if (duration.isNegative) {
      return "00:00:00";
    }
    final hh = duration.inHours.remainder(24).toString().padLeft(2, '0');
    final mm = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final ss = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hh:$mm:$ss";
  }
}
