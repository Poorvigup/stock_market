import 'package:auravest/src/data/datasources/stock_api_service.dart';
import 'package:auravest/src/domain/entities/stock_data_point.dart';
import 'package:auravest/src/domain/repositories/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApiService _apiService;

  StockRepositoryImpl(this._apiService);

  @override
  Future<List<StockDataPoint>> getStockData(String symbol) async {
    final models = await _apiService.getDailyTimeSeries(symbol);
    return models
        .map((model) => StockDataPoint(
              // Correctly parse the date string from the model
              date: DateTime.parse(model.date),
              open: double.parse(model.open),
              high: double.parse(model.high),
              low: double.parse(model.low),
              close: double.parse(model.close),
              volume: double.parse(model.volume),
            ))
        .toList();
  }
}