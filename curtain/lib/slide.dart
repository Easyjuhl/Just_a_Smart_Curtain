import 'package:flutter/material.dart';
import 'handler.dart';

class ControlSlider extends StatefulWidget {
  const ControlSlider({ Key? key, required this.command}) : super(key: key);

  final Command command;

  @override
  State<ControlSlider> createState() => _ControlSliderState();
}

class _ControlSliderState extends State<ControlSlider> {
  var _sliderValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('0'),
        Slider(
          value: _sliderValue,
          onChanged: (newValue) {
            setState(() {
              _sliderValue = newValue;
              widget.command.sliderVal = newValue.toInt();
            });
          },
          min: 0.0,
          max: 100.0,
        ),
        const Text('100')
      ],
    );
  }
}