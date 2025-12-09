import 'package:auravest/src/data/datasources/linear_regression_model.dart';
import 'package:auravest/src/data/datasources/stock_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auravest/src/data/datasources/prediction_service.dart';
import 'package:auravest/src/data/repositories/stock_repository_impl.dart';
import 'package:auravest/src/domain/entities/stock_data_point.dart';
import 'package:auravest/src/domain/entities/stock_forecast.dart';
import 'package:auravest/src/domain/repositories/stock_repository.dart';

// --- CORE DATA PROVIDERS ---

final dioProvider = Provider<Dio>((ref) => Dio());

final stockApiServiceProvider =
    Provider<StockApiService>((ref) => StockApiService(ref.watch(dioProvider)));

final stockRepositoryProvider = Provider<StockRepository>(
    (ref) => StockRepositoryImpl(ref.watch(stockApiServiceProvider)));

// Provider to fetch the USD to INR exchange rate.
final exchangeRateProvider = FutureProvider<double>((ref) async {
  return ref.watch(stockApiServiceProvider).getUsdToInrExchangeRate();
});

// Provider to fetch the historical stock data.
final stockDataProvider =
    FutureProvider.family<List<StockDataPoint>, String>((ref, symbol) {
  return ref.watch(stockRepositoryProvider).getStockData(symbol);
});


// --- PREDICTION AND STATE MANAGEMENT PROVIDERS ---

// Provider for the PredictionService.
final predictionServiceProvider = Provider<PredictionService>((ref) {
  return PredictionService();
});

// The StateNotifierProvider that manages the state for the StockDetailScreen.
final stockDetailProvider = StateNotifierProvider.autoDispose
    .family<StockDetailNotifier, AsyncValue<StockDetailState>, String>(
        (ref, symbol) {
  return StockDetailNotifier(
    stockRepository: ref.watch(stockRepositoryProvider),
    predictionService: ref.watch(predictionServiceProvider),
    symbol: symbol,
  );
});

// A state class to hold all the data needed for the detail screen.
class StockDetailState {
  final List<StockDataPoint> historicalData;
  final List<StockForecast>? forecast;
  final List<StockForecast>? backtest;

  StockDetailState({required this.historicalData, this.forecast, this.backtest});
}

// The StateNotifier that contains all the business logic for the detail screen.
class StockDetailNotifier
    extends StateNotifier<AsyncValue<StockDetailState>> {
  final StockRepository _stockRepository;
  final PredictionService _predictionService;
  final String _symbol;

  // This final field is now correctly initialized in the constructor.
  final List<String> availableModels;
  void _updateStateWithForecast(List<double> forecastValues) async {
    if (_historicalData.isEmpty) return;
    
    // --- GENERATE BACKTEST DATA ---
    // Use the reversed historical data for the backtest function.
    final historicalDataForModel = _historicalData.reversed.toList();
    final backtestData = await _predictionService.getBacktestedPredictions(
        availableModels.first, // Or the currently selected model
        historicalDataForModel
    );
    // --- END OF GENERATION ---

    DateTime lastDate = _historicalData.first.date;
    final forecastPoints = forecastValues.asMap().entries.map((entry) {
      return StockForecast(
        date: lastDate.add(Duration(days: entry.key + 1)),
        value: entry.value,
      );
    }).toList();

    // 3. Include the backtest data when updating the state.
    state = AsyncValue.data(StockDetailState(
      historicalData: _historicalData,
      forecast: forecastPoints,
      backtest: backtestData, // <-- PASS THE NEW DATA
    ));
  }

  // The constructor with the corrected initializer list syntax.
  StockDetailNotifier({
    required StockRepository stockRepository,
    required PredictionService predictionService,
    required String symbol,
  })  : _stockRepository = stockRepository,
        _predictionService = predictionService,
        _symbol = symbol,
        // The initializer list uses a colon ':' to assign values before the constructor body runs.
        availableModels = _getModelsForSymbol(symbol),
        super(const AsyncValue.loading()) {
    // The constructor body now only calls _init.
    _init();
  }
  
  // Static helper function to keep the constructor clean.
  static List<String> _getModelsForSymbol(String symbol) {
    if (symbol.toUpperCase() == 'TCS.NS' || symbol.toUpperCase() == 'TCS.BO') {
      // For TCS, offer both the Dart model and the future TFLite models.
      return const [
        'linear_regression',
        'random_forest',
        // 'svr',
        // 'xg_boost'
      ];
    } else {
      // For any other stock, we can offer the Dart Linear Regression as a generic model.
      return const [
        'linear_regression'
      ];
    }
  }

  // Private fields to hold data within the notifier.
  List<StockDataPoint> _historicalData = [];

  // Initializes the notifier by loading models and fetching initial data.
  Future<void> _init() async {
    state = const AsyncValue.loading();
    try {
      // Load all possible models so they are ready if needed.
      await _predictionService.loadModels(['linear_regression', 'random_forest']);
      _historicalData = await _stockRepository.getStockData(_symbol);
      // Generate the initial forecast with the first model in our dynamic list.
      await generateForecast(availableModels.first);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  // Generates a new forecast based on the selected model name.
  Future<void> generateForecast(String modelName) async {
    try {
      if (_historicalData.isEmpty) return;

      // 1. Get the data ready for the models.
      final historicalDataForModel = _historicalData.reversed.toList();
      
      // 2. Generate the FUTURE forecast (for the orange line).
      // We will simulate this for now to match the Linear Regression Dart model.
      final lastDataPoint = historicalDataForModel.last;
      final features = [
        lastDataPoint.open,
        lastDataPoint.high,
        lastDataPoint.low,
        lastDataPoint.close,
        lastDataPoint.volume
      ];
      final singlePrediction = LinearRegressionModel().score(features);
      final forecastValues = List.generate(5, (i) => singlePrediction * (1 + (i * 0.001)));

      // 3. Generate the BACKTEST predictions (for the purple line).
      final backtestData = await _predictionService.getBacktestedPredictions(
          modelName, historicalDataForModel);
      
      // 4. Prepare the forecast points for the chart.
      DateTime lastDate = _historicalData.first.date;
      final forecastPoints = forecastValues.asMap().entries.map((entry) {
        return StockForecast(
          date: lastDate.add(Duration(days: entry.key + 1)),
          value: entry.value,
        );
      }).toList();

      // 5. Update the state ONCE with ALL the data ready.
      state = AsyncValue.data(StockDetailState(
        historicalData: _historicalData,
        forecast: forecastPoints,
        backtest: backtestData, // The backtest data is now included correctly.
      ));

    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}