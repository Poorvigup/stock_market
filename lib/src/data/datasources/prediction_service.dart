import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:auravest/src/domain/entities/stock_data_point.dart';

class PredictionService {
  final Map<String, Interpreter> _interpreters = {};

  // --- 1. Add your MEAN and SCALE constants here ---
  static const _mean = [1680.771, 1697.5345, 1663.7554, 1682.4292, 7054084.3226];
  static const _scale = [181.9071, 183.6897, 179.9181, 181.4488, 3095167.0655];
  
  Future<void> loadModels(List<String> modelNames) async {
    try {
      for (var name in modelNames) {
        _interpreters[name] = await Interpreter.fromAsset('$name.tflite');
      }
      print('All models loaded successfully.');
    } catch (e) {
      print('Failed to load models: $e');
    }
  }

  // --- 2. The getPrediction method is now completely replaced ---
  Future<List<double>> getPrediction(
      String modelName, List<StockDataPoint> historicalData) async {
    final interpreter = _interpreters[modelName];

    if (interpreter == null) {
      throw Exception('Model $modelName is not loaded.');
    }
    
    // Define the lookback window (how many previous days the model needs).
    // This MUST match what the model was trained with. We'll assume 10 for this example.
    const int lookbackWindow = 10;

    if (historicalData.length < lookbackWindow) {
      throw Exception('Not enough historical data to make a prediction.');
    }

    // --- 3. Preprocessing: Normalize the input data ---
    // Get the last `lookbackWindow` data points.
    final recentData = historicalData.sublist(historicalData.length - lookbackWindow);

    // Create the input tensor with the correct shape [1, lookbackWindow, 5 features].
    final input = List.generate(1, (_) => 
      List.generate(lookbackWindow, (i) {
        final point = recentData[i];
        return [
          (point.open - _mean[0]) / _scale[0],
          (point.high - _mean[1]) / _scale[1],
          (point.low - _mean[2]) / _scale[2],
          (point.close - _mean[3]) / _scale[3],
          (point.volume - _mean[4]) / _scale[4],
        ];
      })
    );
    
    // Prepare the output tensor. Let's assume the model predicts the next 5 days.
    // The shape should be [1, 5] for 5 predicted values.
    var output = List.filled(1 * 5, 0.0).reshape([1, 5]);

    // Run inference.
    interpreter.run(input, output);
    
    // --- 4. Postprocessing: Denormalize the output data ---
    // We assume the model predicts the 'close' price.
    // So, we use the mean and scale for the 'close' feature (index 3).
    final double closeMean = _mean[3];
    final double closeScale = _scale[3];

    final List<double> forecast = [];
    for (var normalizedValue in output[0]) {
      final denormalizedValue = (normalizedValue * closeScale) + closeMean;
      forecast.add(denormalizedValue);
    }
    
    return forecast;
  }
}