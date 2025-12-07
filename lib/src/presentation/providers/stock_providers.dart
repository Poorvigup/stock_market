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

  StockDetailState({required this.historicalData, this.forecast});
}

// The StateNotifier that contains all the business logic for the detail screen.
class StockDetailNotifier
    extends StateNotifier<AsyncValue<StockDetailState>> {
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
    if (symbol.toUpperCase() == 'INFY.NS') {
      // If it's Infosys, offer both models.
      return const ['linear_regression', 'random_forest'];
    } else {
      // For any other stock, ONLY offer the generic Linear Regression model.
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

      if (modelName == 'random_forest' && _symbol.toUpperCase() == 'INFY.NS') {
        final historicalDataForModel = _historicalData.reversed.toList();
        final forecastValues = await _predictionService.getPrediction(
            modelName, historicalDataForModel);
        _updateStateWithForecast(forecastValues);
      } else {
        // Fallback for our simulated Linear Regression model for any stock.
        final historicalClosePrices = _historicalData.map((d) => d.close).toList().reversed.toList();
        final lastValue = historicalClosePrices.last;
        final forecastValues = List.generate(5, (i) => lastValue * (1 + (i+1) * 0.002));
        _updateStateWithForecast(forecastValues);
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  // Helper method to update the state with a new forecast.
  void _updateStateWithForecast(List<double> forecastValues) {
    if (_historicalData.isEmpty) return;
    
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
    ));
  }
}