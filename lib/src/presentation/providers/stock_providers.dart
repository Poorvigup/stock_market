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

  StockDetailState(
      {required this.historicalData, this.forecast, this.backtest});
}

// The StateNotifier that contains all the business logic for the detail screen.
class StockDetailNotifier extends StateNotifier<AsyncValue<StockDetailState>> {
  final StockRepository _stockRepository;
  final PredictionService _predictionService;
  final String _symbol;

  // This final field is now correctly initialized in the constructor.
  final List<String> availableModels;
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
        'svr',
        'xg_boost'
      ];
    } else {
      // For any other stock, we can offer the Dart Linear Regression as a generic model.
      return const ['linear_regression'];
    }
  }

  // Private fields to hold data within the notifier.
  List<StockDataPoint> _historicalData = [];

  // Initializes the notifier by loading models and fetching initial data.
  Future<void> _init() async {
    state = const AsyncValue.loading();
    try {
      // Load all possible models so they are ready if needed.
      _historicalData = await _stockRepository.getStockData(_symbol);
      // Generate the initial forecast with the first model in our dynamic list.
      await generateForecast(availableModels.first);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  // Generates a new forecast based on the selected model name.
// --- REPLACE your old generateForecast method with THIS one ---
  Future<void> generateForecast(String modelName) async {
    try {
      if (_historicalData.isEmpty) return;

      final historicalDataForModel = _historicalData.reversed.toList();

      // --- THIS IS THE FIX ---
      // 1. We no longer do ANY model logic here. We just call the service.
      // The PredictionService will handle the switch statement and all normalization.
      final forecastValues = await _predictionService.getPrediction(
        modelName,
        historicalDataForModel,
      );
      // --- END OF FIX ---

      // --- BACKTEST LOGIC ---
      // This part remains the same.
      final backtestData = await _predictionService.getBacktestedPredictions(
          modelName, historicalDataForModel);

      // --- PREPARE and UPDATE STATE ---
      // This part remains the same.
      DateTime lastDate = _historicalData.first.date;
      final forecastPoints = forecastValues.asMap().entries.map((entry) {
        return StockForecast(
          date: lastDate.add(Duration(days: entry.key + 1)),
          value: entry.value,
        );
      }).toList();

      state = AsyncValue.data(StockDetailState(
        historicalData: _historicalData,
        forecast: forecastPoints,
        backtest: backtestData,
      ));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
