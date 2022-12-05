import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

class MyBody extends StatefulWidget {
  @override
  _MyBody createState() => _MyBody();
}

class _MyBody extends State<MyBody> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '나의 변화',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: dummyData1,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.indigo,
                ),
                // The orange line
                LineChartBarData(
                  spots: dummyData2,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.red,
                ),
                // The blue line
                LineChartBarData(
                  spots: dummyData3,
                  isCurved: false,
                  barWidth: 3,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}



final List<FlSpot> dummyData1 = List.generate(8, (index) {
  return FlSpot(index.toDouble(), index * Random().nextDouble());
});

// This will be used to draw the orange line
final List<FlSpot> dummyData2 = List.generate(8, (index) {
  return FlSpot(index.toDouble(), index * Random().nextDouble());
});

// This will be used to draw the blue line
final List<FlSpot> dummyData3 = List.generate(8, (index) {
  return FlSpot(index.toDouble(), index * Random().nextDouble());
});