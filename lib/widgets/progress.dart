import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: Center(
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Colors.blue,
                value: 75,
                title: 'Completed',
                radius: 60,
                titleStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              PieChartSectionData(
                color: Colors.orange,
                value: 20,
                title: 'In Progress',
                radius: 60,
                titleStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              PieChartSectionData(
                color: Colors.red,
                value: 5,
                title: 'Not Started',
                radius: 60,
                titleStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
