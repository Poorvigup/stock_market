import 'package:auravest/src/domain/entities/stock_data_point.dart';
import 'package:auravest/src/domain/entities/stock_forecast.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
// --- 1. Import your new Dart model file ---
import 'linear_regression_model.dart';

class PredictionService {
  // For TFLite models
  final Map<String, Interpreter> _interpreters = {};
  
  // --- 2. Create an instance of your Dart model ---
  final _linearRegressionModel = LinearRegressionModel();

  // Stats for your TFLite models (e.g., Random Forest for TCS)
  // TODO: Replace with the actual MEAN and SCALE values for your TCS Random Forest model.
  static const _tcsRfMean = [3459.7615, 3488.3833, 3429.0234, 3460.9052, 2688315.8508];
  static const _tcsRfScale = [416.7372, 422.4238, 409.08, 416.0, 1.0];

  // This will load only the models that need TFLite.
  Future<void> loadModels(List<String> modelNames) async {
    try {
      for (var name in modelNames) {
        if (name == 'linear_regression') continue;
        
        if (!_interpreters.containsKey(name)) {
          _interpreters[name] = await Interpreter.fromAsset('$name.tflite');
        }
      }
      print('TFLite models loaded successfully.');
    } catch (e) {
      print('Failed to load TFLite models: $e');
    }
  }

  Future<List<double>> getPrediction(
      String modelName, List<StockDataPoint> historicalData) async {

    if (historicalData.isEmpty) {
      throw Exception("Cannot predict with no historical data.");
    }
    final lastDataPoint = historicalData.last;

    // --- 3. The Core Logic Change ---
    if (modelName == 'linear_regression') {
      // If the selected model is Linear Regression, use the Dart function.
      print("Predicting with Dart Linear Regression model...");

      // Prepare the input features from the last available day of data.
      final features = [
        lastDataPoint.open,
        lastDataPoint.high,
        lastDataPoint.low,
        lastDataPoint.close,
        lastDataPoint.volume,
      ];

      // Get the single predicted value from your formula.
      final prediction = _linearRegressionModel.score(features);

      // Create a 5-day forecast based on this single prediction.
      // We'll add a tiny upward trend for visualization.
      return List.generate(5, (i) => prediction * (1 + (i * 0.001)));

    } else {
      // For any other model (like Random Forest), use the TFLite logic.
      print("Predicting with TFLite model: $modelName...");
      
      // The rest of this logic is for your TFLite models
      // TODO: Make sure you have a tcs_rf_model.tflite in your assets for this to work.
      await loadModels([modelName]);
      final interpreter = _interpreters[modelName];
      if (interpreter == null) throw Exception('$modelName TFLite model is not loaded.');

      // Preprocessing, Inference, and Postprocessing for TFLite...
      // This is a placeholder and should be adapted for your actual RF model.
      final closeMean = _tcsRfMean[3];
      final closeScale = _tcsRfScale[3];
      return List.generate(5, (i) => (lastDataPoint.close * 1.01) - (i * 5.0))
            .map((val) => (val * closeScale) + closeMean).toList();
    }
  }
  Future<List<StockForecast>> getBacktestedPredictions(
      String modelName, List<StockDataPoint> historicalData) async {
    
    // We will generate a prediction for every day in the historical data.
    final List<StockForecast> backtestPredictions = [];

    if (modelName == 'linear_regression') {
      print("Generating backtest for Dart Linear Regression model...");

      // Loop through each historical data point to make a prediction for the NEXT day.
      for (int i = 0; i < historicalData.length - 1; i++) {
        final currentDay = historicalData[i];
        final nextDay = historicalData[i + 1];

        // Prepare the features from the current day.
        final features = [
          currentDay.open,
          currentDay.high,
          currentDay.low,
          currentDay.close,
          currentDay.volume,
        ];

        // Use the model to predict the next day's price.
        final predictedValue = _linearRegressionModel.score(features);

        // Add the result to our list, using the ACTUAL date of the next day.
        backtestPredictions.add(
          StockForecast(date: nextDay.date, value: predictedValue),
        );
      }
    } else {
      // TODO: You would implement similar looping logic for your TFLite models here.
      // For now, we will return an empty list for other models.
      print("Backtesting for $modelName is not yet implemented.");
    }

    return backtestPredictions;
  }
}