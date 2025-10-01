import 'package:flutter/material.dart';

class FullScreenChartScreen extends StatelessWidget {
  final String title;
  final Widget chart;

  const FullScreenChartScreen({super.key, required this.title, required this.chart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: chart,
        ),
      ),
    );
  }
}
