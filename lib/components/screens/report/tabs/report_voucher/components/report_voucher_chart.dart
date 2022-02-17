import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/models/report/VoucherHistogram.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

const List<Color> kChartColor = [
  Color(0xff39B54A),
  Color(0xff4276FE),
  Color(0xffDA0F00),
];

class ReportVoucherChartData {
  List<String> xAxis = [];
  List<FlSpot> assigned = [];
  List<FlSpot> claimed = [];
  List<FlSpot> expired = [];

  clear() {
    xAxis = [];
    assigned = [];
    claimed = [];
    expired = [];
  }

  setDefault() {
    clear();
    var today = DateTime.now();
    for (int i = 7; i > 0; i--) {
      var cDay = Jiffy(today).subtract(days: i).format('dd-MM');
      xAxis.add(cDay);
      assigned.add(FlSpot(8.0 - i, 0));
      claimed.add(FlSpot(8.0 - i, 0));
      expired.add(FlSpot(8.0 - i, 0));
    }
  }
}

extension ReportVoucherChartDataExtension on ReportVoucherChartData {
  ReportVoucherChartData dataProcessing(VoucherHistogram vh) {
    var data = ReportVoucherChartData();
    var items = vh.items ?? [];
    for (int i = 0; i < items.length; i++) {
      data.xAxis.add(items[i].timePoint!.replaceAll(RegExp(r"(-\d{4})"), ''));
      var stats = items[i].stats ?? [];
      data.assigned.add(FlSpot(i + 1, 0));
      data.claimed.add(FlSpot(i + 1, 0));
      data.expired.add(FlSpot(i + 1, 0));
      for (int j = 0; j < stats.length; j++) {
        switch (stats[j].key!) {
          case 'assigned':
            data.assigned[i] = FlSpot(i + 1, stats[j].amount!.toDouble());
            break;
          case 'claimed':
            data.claimed[i] = FlSpot(i + 1, stats[j].amount!.toDouble());
            break;
          default:
            data.expired[i] = FlSpot(i + 1, stats[j].amount!.toDouble());
            break;
        }
      }
    }
    if (data.xAxis.isEmpty) data.setDefault();
    return data;
  }
}

class ReportVoucherChart extends StatelessWidget {
  const ReportVoucherChart({
    Key? key,
    required ReportVoucherChartData vdata,
  })  : _vdata = vdata,
        super(key: key);

  final ReportVoucherChartData _vdata;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.60,
      child: LineChart(
        LineChartData(
            lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final flSpot = barSpot;
                        return LineTooltipItem(
                          formatNumber(flSpot.y.toInt().toString()) + 'đ',
                          TextStyle(
                              fontSize: 10.sp,
                              fontStyle: FontStyle.normal,
                              color: kChartColor[flSpot.barIndex]),
                        );
                      }).toList();
                    },
                    tooltipBgColor: Colors.blueGrey.withOpacity(0.3))),
            gridData: FlGridData(
              show: false,
            ),
            titlesData: FlTitlesData(
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    if (value % 1 == 0 && value <= _vdata.xAxis.length) {
                      return (value % (_vdata.assigned.length ~/ 7) == 0)
                          ? _vdata.xAxis[value.toInt() - 1]
                          : '';
                    }
                    return value.toString();
                  },
                  reservedSize: 22.w,
                  margin: 10.w,
                  interval: 1,
                  getTextStyles: (context, value) =>
                      TextStyle(color: kGray2, fontSize: 9.sp),
                  rotateAngle: 40,
                ),
                rightTitles: SideTitles(showTitles: false),
                topTitles: SideTitles(showTitles: false),
                leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) =>
                        TextStyle(color: kGray2, fontSize: 8.sp))),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(color: Color(0xff4e4965), width: 1),
                left: BorderSide(color: Colors.transparent),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                  isCurved: false,
                  colors: [const Color(0xff39B54A)],
                  barWidth: 2.w,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                        strokeWidth: 0,
                        radius: 2.5,
                        color: kChartColor[0].withOpacity(0.5)),
                  ),
                  belowBarData: BarAreaData(show: false),
                  spots: _vdata.assigned),
              LineChartBarData(
                isCurved: false,
                colors: [const Color(0xff4276FE)],
                barWidth: 2.w,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                      strokeWidth: 0,
                      radius: 2.5,
                      color: kChartColor[1].withOpacity(0.5)),
                ),
                belowBarData: BarAreaData(show: false, colors: [
                  const Color(0x00aa4cfc),
                ]),
                spots: _vdata.claimed,
              ),
              LineChartBarData(
                isCurved: false,
                colors: const [Color(0xffDA0F00)],
                barWidth: 2.w,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                      strokeWidth: 0,
                      radius: 2.5,
                      color: kChartColor[2].withOpacity(0.5)),
                ),
                belowBarData: BarAreaData(show: false),
                spots: _vdata.expired,
              )
            ]),
      ),
    );
  }
}
