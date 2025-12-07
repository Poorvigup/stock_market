import 'package:dio/dio.dart';
import 'package:auravest/src/data/models/stock_data_point_model.dart';
import 'package:flutter/foundation.dart';

class StockApiService {
  final Dio _dio;
  final String _apiKey = '51WSBF1F1LW1MK7G'; // Replace with your Alpha Vantage API key

  StockApiService(this._dio);

   Future<double> getUsdToInrExchangeRate() async {
    try {
      final response = await _dio.get(
        'https://www.alphavantage.co/query',
        queryParameters: {
          'function': 'CURRENCY_EXCHANGE_RATE',
          'from_currency': 'USD',
          'to_currency': 'INR',
          'apikey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey('Realtime Currency Exchange Rate')) {
          final String rate = data['Realtime Currency Exchange Rate']['5. Exchange Rate'];
          return double.parse(rate);
        } else {
          throw Exception('Could not parse exchange rate response.');
        }
      } else {
        throw Exception('Failed to load exchange rate.');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to load exchange rate.');
    }
  }

  Future<List<StockDataPointModel>> getDailyTimeSeries(String symbol) async {
    try {
      final response = await _dio.get(
        'https://www.alphavantage.co/query',
        queryParameters: {
          'function': 'TIME_SERIES_DAILY',
          'symbol': symbol,
          'apikey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey('Time Series (Daily)')) {
          final Map<String, dynamic> timeSeries = data['Time Series (Daily)'];
          
          // Map through the time series entries, adding the date key to the data map
          return timeSeries.entries.map((entry) {
            final String date = entry.key;
            final Map<String, dynamic> dailyData = entry.value;
            // Inject the date into the map before parsing
            dailyData['date'] = date;
            return StockDataPointModel.fromJson(dailyData);
          }).toList();

        } else {
          // Handle cases where the API returns an error or note (e.g., invalid symbol)
          throw Exception(data['Note'] ?? 'Invalid API response format');
        }
      } else {
        throw Exception('Failed to load stock data');
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to load stock data due to a network error');
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('API returned an error or note (check symbol or API key).');
    }
  }
}