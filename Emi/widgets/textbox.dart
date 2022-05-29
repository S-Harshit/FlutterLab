import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String label;
  IconData iconData;
  TextEditingController tc;
  late Function fn;

  setFunction(Function fn) {
    this.fn = fn;
  }

  TextBox({
    required String this.label,
    required IconData this.iconData,
    required TextEditingController this.tc,
  }) {
    this.label = label;
    this.iconData = iconData;
    this.tc = tc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (String value) {
          if (this.fn != null) {
            fn(int.parse(value));
          }
        },
        controller: tc,
        decoration: InputDecoration(
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(label),
            hintText: 'Type $label'),
      ),
    );
  }
}
