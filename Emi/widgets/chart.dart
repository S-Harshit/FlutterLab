import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChar extends StatelessWidget {
  PieChar(double pla, double ti) {
    dataMap = {"Pricipal Loan Amount": pla, "Total Interest": ti};
  }

  late Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PieChart(
      dataMap: dataMap,

      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 12,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      ringStrokeWidth: 32,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    ));
  }
}
