import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:auravest/src/domain/entities/stock_data_point.dart';
import 'package:auravest/src/domain/entities/stock_forecast.dart';
import 'package:intl/intl.dart';

// This is a constant color for the tooltip background.
const Color _tooltipBackgroundColor = Color.fromARGB(204, 96, 125, 139);

class StockChart extends StatelessWidget {
  final List<StockDataPoint> data;
  final List<StockForecast>? forecastData;

  const StockChart({Key? key, required this.data, this.forecastData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Reverse the data list so the chart goes from oldest to newest (left to right).
    final reversedData = data.reversed.toList();
    final List<FlSpot> historicalSpots = reversedData
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.close))
        .toList();

    // Create the spots for the forecast line.
    final List<FlSpot> forecastSpots = [];
    if (forecastData != null && historicalSpots.isNotEmpty) {
      // The first forecast spot must connect to the last historical spot.
      forecastSpots.add(historicalSpots.last);
      // Add the rest of the forecast spots.
      for (int i = 0; i < forecastData!.length; i++) {
        forecastSpots.add(FlSpot(
          (historicalSpots.length - 1) + (i + 1).toDouble(),
          forecastData![i].value,
        ));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => _tooltipBackgroundColor,
              getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                return touchedBarSpots.map((barSpot) {
                  final flSpot = barSpot;
                  // Ensure we don't go out of bounds
                  if (flSpot.x.toInt() >= reversedData.length) return null;

                  final date = reversedData[flSpot.x.toInt()].date;
                  final formattedDate = DateFormat.yMMMd().format(date);
                  return LineTooltipItem(
                    '${formattedDate}\n₹${flSpot.y.toStringAsFixed(2)}',
                    const TextStyle(color: Colors.white, fontSize: 12),
                  );
                }).where((item) => item != null).toList().cast<LineTooltipItem>();
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xff37434d).withOpacity(0.2),
              strokeWidth: 1,
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: const Color(0xff37434d).withOpacity(0.2),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: (reversedData.length / 4).floorToDouble(),
                getTitlesWidget: (value, meta) {
                  if (value.toInt() < reversedData.length) {
                    final date = reversedData[value.toInt()].date;
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8.0,
                      child: Text(DateFormat.MMMd().format(date), style: const TextStyle(fontSize: 10)),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                getTitlesWidget: (value, meta) => Text(
                  '₹${value.toInt()}',
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            // The historical data line
            LineChartBarData(
              spots: historicalSpots,
              isCurved: true,
              color: Colors.cyan,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.cyan.withOpacity(0.3),
                    Colors.cyan.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // The forecast line (only rendered if forecastSpots is not empty)
            if (forecastSpots.isNotEmpty)
              LineChartBarData(
                spots: forecastSpots,
                isCurved: true,
                color: Colors.orangeAccent,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                dashArray: [5, 5], // Dashed line style
              ),
          ],
        ),
      ),
    );
  }
}