import 'package:emicalc/widgets/chart.dart';
import 'package:emicalc/widgets/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emicalc/widgets/textbox.dart';

class Emi extends StatefulWidget {
  const Emi({Key? key}) : super(key: key);

  @override
  State<Emi> createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  // int value = 0;
  int _value = 0;
  double _emi = 0.0;
  double monthlyROI = 0;

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  takeSliderValue(int value) {
    print("recieved value from slider $value");
    t3.text = _value.toString();
    _value = value;
    setState(() {});
  }

  _compute() {
    int loanAmount = int.parse(t1.text);
    int roi = int.parse(t2.text);
    int tenure = int.parse(t3.text);
    double monthlyPr = loanAmount / tenure;
    monthlyROI = loanAmount * ((roi / 100)) / tenure;
    _emi = monthlyPr + monthlyROI;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextBox(label: 'Loan Amount', iconData: Icons.money_rounded, tc: t1),
          TextBox(label: 'ROI', iconData: Icons.interests_rounded, tc: t2),
          TextBox(
            label: 'Tenure',
            iconData: Icons.timeline,
            tc: t3,
          ),
          MySlider(takeSliderValue, _value),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                _compute();
              },
              child: Text(
                'Compute',
                style: TextStyle(fontSize: 30),
              )),
          Text('EMI ${_emi}', style: TextStyle(fontSize: 30)),
          PieChar(monthlyROI * 12, _emi * 12)
        ],
      ),
      appBar: AppBar(
        title: Text('Emi Calc'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
