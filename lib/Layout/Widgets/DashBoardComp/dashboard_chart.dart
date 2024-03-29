
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tresto_v002a/Global/constants.dart';

class DashboardChart extends StatelessWidget {
  final List<FlSpot> data;
  final int selectedIndex;
  const DashboardChart({super.key,required this.data,required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    

    Widget getBottomAxisDays(double value) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Mon';
          break;
        case 1:
          text = 'Tue';
          break;
        case 2:
          text = 'Wed';
          break;
        case 3:
          text = 'Wed';
          break;
        case 4:
          text = 'Fri';
          break;
        case 5:
          text = 'Sat';
          break;
        case 6:
          text = 'Sun';
          break;
      }
      return Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.textGrey1,
                  fontSize: 13)),
        ),
      );
    }
    Widget getBottomAxisToday(double value) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = '1';
          break;
        case 1:
          text = '3';
          break;
        case 2:
          text = '5';
          break;
        case 3:
          text = '7';
          break;
        case 4:
          text = '9';
          break;
        case 5:
          text = '11';
          break;
        
      }
      return Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.textGrey1,
                  fontSize: 13)),
        ),
      );
    }
    Widget getBottomAxisMonth(double value) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'J';
          break;
        case 1:
          text = 'F';
          break;
        case 2:
          text = 'M';
          break;
        case 3:
          text = 'A';
          break;
        case 4:
          text = 'M';
          break;
        case 5:
          text = 'J';
          break;
        case 6:
          text = 'J';
          break;
        case 7:
          text = 'A';
          break;
        case 8:
          text = 'O';
          break;
        case 9:
          text = 'N';
          break;
        case 10:
          text = 'D';
          break;

        
      }
      return Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.textGrey1,
                  fontSize: 11)),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: LineChart(
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 300),
          LineChartData(
            lineTouchData: const LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipRoundedRadius: 12.0,
                )),
            maxX: selectedIndex == 0 ? 6 : (selectedIndex == 1 ? 10: 5),
            maxY: 15000,
            gridData: const FlGridData(
              show: false,
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                reservedSize: 45,
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) => selectedIndex == 0 ? getBottomAxisDays(value) : (selectedIndex == 1 ?  getBottomAxisMonth(value) : getBottomAxisToday(value) ),
              )),
              rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                reservedSize: 36,
                showTitles: true,
                interval: 5000,
                getTitlesWidget: (value, meta) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Text(
                    "${(value / 1000).toString()}K",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.textGrey1,
                            fontSize: 11)),
                  ),
                ),
              )),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            backgroundColor: Colors.transparent,
            lineBarsData: [
              // The orange line
              LineChartBarData(
                spots: data,
                isCurved: true,
                preventCurveOverShooting: true,
                barWidth: 3,
                color: AppColor.trestoRed,
              ),
            ],
          )),
    );
  }
}
