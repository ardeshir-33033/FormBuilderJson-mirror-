import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderInput extends StatefulWidget {
  String name;
  double rating;
  double min;
  double max;
  int division;

  Function(String name, double result) OnSliderChange;

  SliderInput({
    @required this.name,
    @required this.min,
    @required this.max,
    @required this.rating,
    @required this.OnSliderChange,
    this.division,
  });

  @override
  _SliderInputState createState() => _SliderInputState();
}

class _SliderInputState extends State<SliderInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:15.0),
      child: Slider(
        activeColor: Color(0xFFEb5151),
        inactiveColor: Colors.grey,
        value: widget.rating,
        onChanged: (newRating) {
          setState(() {
            widget.rating = newRating;
            widget.OnSliderChange(widget.name, newRating);
          });
        },
        min: widget.min,
        max: widget.max,
        divisions: widget.division?? widget.max.toInt() + 1 - widget.min.toInt(),
      ),
    );
  }
}
