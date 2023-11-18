import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartData {
  final String year;

  final int revenueValue;


  BarChartData(this.year,  this.revenueValue);
}
class VerticalBarChart extends StatelessWidget {
  final List<BarChartData> chartData = [
    BarChartData('2018', 5000,),
    BarChartData('2019', 18000,),
    BarChartData('2020', 10000,),
    BarChartData('2021', 4000,),
    BarChartData('2022',40000, ),
    BarChartData('2023', 20000,),
    BarChartData('2024', 15000,),
    // Add more data as needed
  ];

  VerticalBarChart({super.key});
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
    borderWidth: 0,
      borderColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(color:
          Colors.transparent),
          labelStyle: Styles.circularStdRegular(context,fontWeight: FontWeight.w500,color: AppColors.greyLightColor,fontSize: 13.sp)),
      primaryYAxis: NumericAxis(isVisible: true,


numberFormat: NumberFormat.compact(),
          // Number of ticks on Y-axis
          majorGridLines: const MajorGridLines(color:

          Colors.transparent),
          majorTickLines: const MajorTickLines(size: 0)
      ),
      series: <ColumnSeries<BarChartData, String>>[
        ColumnSeries<BarChartData, String>(
         // trackColor: Colors.transparent,
          isTrackVisible: false,
          dataSource: chartData,
          xValueMapper: (BarChartData data, _) => data.year,
          yValueMapper: (BarChartData data, _) => data.revenueValue,
          name: '',
          color: AppColors.primaryColor,
          width: 0.4,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.sp),topRight: Radius.circular(10.sp)), // Dark blue color for completed
// Light blue color for pending


        ),

      ],
    );
  }
}

