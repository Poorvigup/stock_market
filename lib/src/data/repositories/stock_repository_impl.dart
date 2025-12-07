import 'package:auravest/src/data/datasources/stock_api_service.dart';
import 'package:auravest/src/domain/entities/stock_data_point.dart';
import 'package:auravest/src/domain/repositories/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApiService _apiService;

  // --- THIS IS THE FIX ---
  // 1. Add a private variable to cache the exchange rate.
  // It is nullable, so it starts as null.
  double? _cachedUsdToInrRate;
  // --- END OF FIX ---

  StockRepositoryImpl(this._apiService);

  bool _isIndianStock(String symbol) {
    return symbol.toUpperCase().endsWith('.NS') || symbol.toUpperCase().endsWith('.BO');
  }

  // A safe function to parse strings into doubles.
  double _safeParseDouble(String value) {
    return double.tryParse(value) ?? 0.0;
  }

  @override
  Future<List<StockDataPoint>> getStockData(String symbol) async {
    final models = await _apiService.getDailyTimeSeries(symbol);

    if (_isIndianStock(symbol)) {
      // Data is already in INR. No conversion needed.
      return models.map((model) {
        return StockDataPoint(
          date: DateTime.parse(model.date),
          open: _safeParseDouble(model.open),
          high: _safeParseDouble(model.high),
          low: _safeParseDouble(model.low),
          close: _safeParseDouble(model.close),
          volume: _safeParseDouble(model.volume),
        );
      }).toList();
    } else {
      // This is a US stock, so we need to convert it.
      
      // --- THIS IS THE FIX ---
      // 2. Check if the rate is already cached.
      if (_cachedUsdToInrRate == null) {
        // If not, fetch it from the API and store it.
        print("Fetching and caching the exchange rate...");
        _cachedUsdToInrRate = await _apiService.getUsdToInrExchangeRate();
      }
      // --- END OF FIX ---

      // 3. Use the cached rate for the conversion.
      final rate = _cachedUsdToInrRate!;

      return models.map((model) {
        return StockDataPoint(
          date: DateTime.parse(model.date),
          open: _safeParseDouble(model.open) * rate,
          high: _safeParseDouble(model.high) * rate,
          low: _safeParseDouble(model.low) * rate,
          close: _safeParseDouble(model.close) * rate,
          volume: _safeParseDouble(model.volume),
        );
      }).toList();
    }
  }
}