import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  Function fn;
  int value;

  MySlider(this.fn, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Slider(
      value: this.value.toDouble(),
      max: 15,
      min: 0,
      onChanged: (double value) {
        fn(value.toInt());
      },
    ));
  }
}
