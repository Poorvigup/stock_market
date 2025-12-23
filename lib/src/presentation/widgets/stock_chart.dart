import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:auravest/src/domain/entities/stock_data_point.dart';
import 'package:auravest/src/domain/entities/stock_forecast.dart';
import 'package:intl/intl.dart';
import 'package:auravest/src/core/app_colors.dart'; // Import your new colors

class StockChart extends StatelessWidget {
  final List<StockDataPoint> data;
  final List<StockForecast>? forecastData;
  final List<StockForecast>? backtestData;

  const StockChart({
    Key? key,
    required this.data,
    this.forecastData,
    this.backtestData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Reverse the data list so the chart goes from oldest to newest (left to right).
    final reversedData = data.reversed.toList();
    
    // --- Create Spots for each line ---

    // 1. Historical Data Spots
    final List<FlSpot> historicalSpots = reversedData
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.close))
        .toList();

    // 2. Future Forecast Spots
    final List<FlSpot> forecastSpots = [];
    if (forecastData != null && historicalSpots.isNotEmpty) {
      forecastSpots.add(historicalSpots.last);
      for (int i = 0; i < forecastData!.length; i++) {
        forecastSpots.add(FlSpot(
          (historicalSpots.length - 1) + (i + 1).toDouble(),
          forecastData![i].value,
        ));
      }
    }

    // 3. Backtested Prediction Spots
    final List<FlSpot> backtestSpots = [];
    if (backtestData != null) {
      final dateToIndexMap = {
        for (var i = 0; i < reversedData.length; i++) reversedData[i].date: i
      };
      for (final prediction in backtestData!) {
        if (dateToIndexMap.containsKey(prediction.date)) {
          final index = dateToIndexMap[prediction.date]!;
          backtestSpots.add(FlSpot(index.toDouble(), prediction.value));
        }
      }
    }

    return Card(
      // The Card widget uses the styling from our AppTheme.
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      shadowColor: AppColors.primaryDark.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
        child: LineChart(
          LineChartData(
            // --- Touch Behavior ---
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpot) => AppColors.primaryDark,
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((barSpot) {
                    final flSpot = barSpot;
                    if (flSpot.x.toInt() >= reversedData.length) return null;

                    final date = reversedData[flSpot.x.toInt()].date;
                    final formattedDate = DateFormat.yMMMd().format(date);
                    return LineTooltipItem(
                      '${formattedDate}\n₹${flSpot.y.toStringAsFixed(2)}',
                      const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  }).whereType<LineTooltipItem>().toList();
                },
              ),
            ),

            // --- Grid and Border ---
            gridData: FlGridData(show: false), // A cleaner look without the grid
            borderData: FlBorderData(show: false),

            // --- Axis Titles ---
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
                        child: Text(DateFormat.MMMd().format(date), style: const TextStyle(fontSize: 10, color: AppColors.primaryDark)),
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
                    style: const TextStyle(fontSize: 10, color: AppColors.primaryDark),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),

            // --- Line Data ---
            lineBarsData: [
              // 1. Historical Data Line (Solid Blue)
              LineChartBarData(
                spots: historicalSpots,
                isCurved: true,
                color: AppColors.chartLine,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.chartLine.withOpacity(0.3),
                      AppColors.chartLine.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              
              // 2. Future Forecast Line (Dashed Orange)
              if (forecastSpots.isNotEmpty)
                LineChartBarData(
                  spots: forecastSpots,
                  isCurved: true,
                  color: AppColors.accentYellow,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                  dashArray: [5, 5],
                ),
              
              // 3. Backtest Line (Dotted Purple)
              if (backtestSpots.isNotEmpty)
                LineChartBarData(
                  spots: backtestSpots,
                  isCurved: true,
                  color: Colors.purpleAccent,
                  barWidth: 2,
                  dotData: FlDotData(show: false),
                  dashArray: [2, 4],
                ),
            ],
          ),
        ),
      ),
    );
  }
}