import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample4 extends StatefulWidget {
  final List sevenDayData;
  const BarChartSample4({
    Key? key,
    required this.sevenDayData,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  // final Color dark = const Color(0xff3b8c75);
  // final Color normal = const Color(0xff64caad);
  // final Color light = const Color(0xff73e8c9);
  final Color normal = const Color.fromARGB(255, 255, 246, 160);
  final Color dark = Color.fromARGB(255, 255, 197, 24);

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff939393), fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Su';
        break;
      case 1:
        text = 'Mo';
        break;
      case 2:
        text = 'Tu';
        break;
      case 3:
        text = 'We';
        break;
      case 4:
        text = 'Th';
        break;
      case 5:
        text = 'Fr';
        break;
      case 6:
        text = 'Sa';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      child: Text(text, style: style),
      axisSide: meta.axisSide,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      color: Color(
        0xff939393,
      ),
      fontSize: 10,
    );
    return SideTitleWidget(
      child: Text(
        meta.formattedValue,
        style: style,
      ),
      axisSide: meta.axisSide,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xffe7e8ec),
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                // groupsSpace: 4,
                barGroups: getData(widget.sevenDayData),
                // barGroups: getData(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(sevenDayData) {
    // List<BarChartGroupData> getData() {
    // print('hi $sevenDayData');
    double w = MediaQuery.of(context).size.width;
    w = w - 8 * 6 - 8 * 4 - 120;
    w = w / 7;

    return [
      // BarChartGroupData(
      //   x: 0,
      //   barsSpace: 12,
      //   barRods: [
      //     BarChartRodData(
      //         toY: 400,
      //         rodStackItems: [
      //           BarChartRodStackItem(0, 200, dark),
      //           BarChartRodStackItem(200, 400, normal),
      //         ],
      //         borderRadius: const BorderRadius.all(Radius.zero)),
      //   ],
      // ),
      ...sevenDayData.map(
        (e) => BarChartGroupData(
          x: e['day'],
          barsSpace: 8,
          barRods: [
            BarChartRodData(
                toY: e['revenue'],
                width: w,
                rodStackItems: [
                  BarChartRodStackItem(0, e['margin'], dark),
                  BarChartRodStackItem(e['margin'], e['revenue'], normal),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ],
        ),
      ),
    ];
  }
}
