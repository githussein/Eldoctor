import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CasesBarChart extends StatelessWidget {
  final List<double> casesList;

  //a constructor to get the list
  const CasesBarChart({@required this.casesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.70),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Daily cases Chart',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 20.0,
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10.0,
                    rotateAngle: 45.0,
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Jan 07';
                        case 1:
                          return 'Jan 08';
                        case 2:
                          return 'Jan 09';
                        case 3:
                          return 'Jan 10';
                        case 4:
                          return 'Jan 11';
                        case 5:
                          return 'Jan 12';
                        case 6:
                          return 'Jan 13';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                      getTitles: (value) {
                        if (value == 0)
                          return '0';
                        else if (value % 4 == 0) return '${value ~/ 4 * 4}K';
                        return '';
                      }),
                ),
                gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 2 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                          color: Colors.grey,
                          strokeWidth: 0.50,
                          dashArray: [5],
                        )),
                barGroups: casesList
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        BarChartGroupData(
                          x: key,
                          barRods: [
                            BarChartRodData(
                              y: value,
                              colors: [Colors.green, Colors.orange, Colors.red],
                            )
                          ],
                        )))
                    .values
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
