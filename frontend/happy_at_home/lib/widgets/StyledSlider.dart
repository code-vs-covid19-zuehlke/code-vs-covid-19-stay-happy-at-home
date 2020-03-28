import 'package:flutter/material.dart';

class StyledSlider extends StatefulWidget {
  final double initialValue;
  final Function onValueChanged;

  StyledSlider(this.initialValue, this.onValueChanged);

  @override
  _StyledSliderState createState() =>
      _StyledSliderState(initialValue, onValueChanged);
}

class _StyledSliderState extends State<StyledSlider> {
  final double initialValue;
  final Function onValueChanged;
  double sliderValue;

  @override
  void initState() {
    super.initState();
    sliderValue = initialValue;
  }

  _StyledSliderState(this.initialValue, this.onValueChanged);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.black,
        inactiveTrackColor: Colors.greenAccent,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 2.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
        thumbColor: Colors.black,
        overlayColor: Colors.black.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        activeTickMarkColor: Colors.black,
        inactiveTickMarkColor: Colors.greenAccent,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Colors.black,
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
            fontFamily: "Comfortaa"
        ),
      ),
      child: Slider(
        min: 0.0,
        max: 30.0,
        value: sliderValue,
        label: "$sliderValue",
        divisions: 6,
        onChanged: (value) {
          setState(() {
            sliderValue = value;
          });
          onValueChanged(value);
        },
      ),
    );
  }
}
