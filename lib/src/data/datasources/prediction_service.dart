import 'dart:math';
import 'package:tflite_flutter/tflite_flutter.dart';

class PredictionService {
  final Map<String, Interpreter> _interpreters = {};

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

  Future<List<double>> getPrediction(
      String modelName, List<double> historicalData) async {
    final interpreter = _interpreters[modelName];

    if (interpreter == null) {
      throw Exception('Model $modelName is not loaded.');
    }

    // Since we don't have real models, we will simulate their behavior here.
    
    // --- Simulation Logic ---
    final lastValue = historicalData.last;
    final recentData = historicalData.length > 5 
        ? historicalData.sublist(historicalData.length - 5) 
        : historicalData;
    
    // Calculate the average trend (slope) from the last 5 days.
    double slope = 0;
    if (recentData.length > 1) {
        double sumOfSlopes = 0;
        for (int i = 1; i < recentData.length; i++) {
            sumOfSlopes += (recentData[i] - recentData[i-1]);
        }
        slope = sumOfSlopes / (recentData.length - 1);
    }

    // Generate predictions based on the selected model type.
    switch (modelName) {
      case 'linear_regression':
        // Linear regression predicts a straight line based on the calculated slope.
        return List.generate(5, (i) => lastValue + (slope * (i + 1)));

      case 'random_forest':
        // Random Forest might produce a less smooth, slightly varied trend.
        // We'll simulate this by adding small, random noise to the linear trend.
        final random = Random();
        final noiseFactor = lastValue * 0.005; // Noise up to 0.5% of the last price
        return List.generate(5, (i) {
          final linearPoint = lastValue + (slope * (i + 1));
          final noise = (random.nextDouble() - 0.5) * noiseFactor; // Random value between -0.25% and +0.25%
          return linearPoint + noise;
        });
        
      default:
        // Fallback to a simple linear prediction.
        return List.generate(5, (i) => lastValue + (slope * (i + 1)));
    }
  }
}