import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auravest/src/data/datasources/prediction_service.dart';
import 'package:auravest/src/data/datasources/stock_api_service.dart';
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
// This is now only used as a dependency for the StateNotifier.
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

  StockDetailState({required this.historicalData, this.forecast});
}

// The StateNotifier that contains all the business logic for the detail screen.
class StockDetailNotifier
    extends StateNotifier<AsyncValue<StockDetailState>> {
  final StockRepository _stockRepository;
  final PredictionService _predictionService;
  final String _symbol;

  List<StockDataPoint> _historicalData = [];
  
  // The updated list of available models.
  // The UI will read this list to build the dropdown.
  final List<String> availableModels = const [
    'linear_regression',
    'random_forest'
  ];

  StockDetailNotifier({
    required StockRepository stockRepository,
    required PredictionService predictionService,
    required String symbol,
  })  : _stockRepository = stockRepository,
        _predictionService = predictionService,
        _symbol = symbol,
        super(const AsyncValue.loading()) {
    _init();
  }

  // Initializes the notifier by loading models and fetching initial data.
  Future<void> _init() async {
    state = const AsyncValue.loading();
    try {
      await _predictionService.loadModels(availableModels);
      _historicalData = await _stockRepository.getStockData(_symbol);
      // Generate the initial forecast with the first model in the list.
      await generateForecast(availableModels.first);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  // Generates a new forecast based on the selected model name.
  // This method is called from the UI whenever the dropdown selection changes.
  Future<void> generateForecast(String modelName) async {
    try {
      // Ensure we have historical data before trying to predict.
      if (_historicalData.isEmpty) return;

      final historicalClosePrices = _historicalData.map((d) => d.close).toList().reversed.toList();
      final forecastValues = await _predictionService.getPrediction(
          modelName, historicalClosePrices);

      // Create dates for the forecast points.
      DateTime lastDate = _historicalData.first.date;
      final forecastPoints = forecastValues.asMap().entries.map((entry) {
        return StockForecast(
          date: lastDate.add(Duration(days: entry.key + 1)),
          value: entry.value,
        );
      }).toList();

      // Update the state with the new forecast data.
      state = AsyncValue.data(StockDetailState(
        historicalData: _historicalData,
        forecast: forecastPoints,
      ));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}