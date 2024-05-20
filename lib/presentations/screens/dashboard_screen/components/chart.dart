import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatelessWidget {
  final List<PieChartSectionData> chartData;
  final String valueText;
  final String labelText;

  const Chart({
     super.key,
    required this.chartData,
    required this.valueText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 1,
              centerSpaceRadius: 50,
              startDegreeOffset: -90,
              sections: chartData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  valueText,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
                Text(labelText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// List<PieChartSectionData> chartData = [
//   PieChartSectionData(
//     color: const Color(secondary),
//     value: 25,
//     showTitle: false,
//     radius: 25,
//   ),
//   PieChartSectionData(
//     color:  Colors.red,
//     value: 20,
//     showTitle: false,
//     radius: 20,
//   ),
//   PieChartSectionData(
//     color: const Color(0xFFFFCF26),
//     value: 10,
//     showTitle: false,
//     radius: 19,
//   ),
// ];
