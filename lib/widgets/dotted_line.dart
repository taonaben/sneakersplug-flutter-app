import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class MyDottedLine extends StatelessWidget {
  const MyDottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.4,
      dashLength: 10.0,
      dashColor: Colors.grey,
      dashGapLength: 8.0,
      dashGapColor: Colors.transparent,
    );
  }
}
