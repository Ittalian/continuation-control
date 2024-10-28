import 'package:continuation_control/models/doing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ConfirmBar extends StatelessWidget {
  final List<Doing> doings;

  const ConfirmBar({
    super.key,
    required this.doings,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white.withOpacity(0.5),
          width: screenWidth * 0.95,
          height: screenWidth * 0.95 * 0.65,
          padding: const EdgeInsets.only(top: 15),
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                border: const Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: false,
                )),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final int index = value.toInt() - 1;
                      if (index >= 0 && index < doings.length) {
                        return Text(
                          doings[index].name,
                          style: const TextStyle(fontSize: 10),
                        );
                      } else {
                        return const Text('');
                      }
                    },
                  ),
                ),
              ),
              barGroups: [
                for (var index = 0; index < doings.length; index++)
                  BarChartGroupData(
                    x: index + 1,
                    barRods: [
                      BarChartRodData(
                        toY: doings[index].currentPeriod.toDouble(),
                        width: 15,
                        color: Colors.blue,
                      ),
                      BarChartRodData(
                        toY: doings[index].maxPeriod.toDouble(),
                        width: 15,
                        color: Colors.red,
                      ),
                      BarChartRodData(
                        toY: doings[index].goalPeriod.toDouble(),
                        width: 15,
                        color: Colors.green,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
