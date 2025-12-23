import 'package:auravest/src/domain/entities/stock_data_point.dart';
import 'package:auravest/src/domain/entities/stock_forecast.dart';
import 'linear_regression_model.dart';
import 'svr_model.dart';
import 'random_forest_model.dart';
import 'xg_boost_model.dart';

class PredictionService {
  final _linearRegressionModel = LinearRegressionModel();
  final _svrModel = SvrModel();
  final _randomForestModel = RandomForestModel();
  final _xgBoostModel = XgBoostModel();

  // Normalization stats for the SVR model.
  static const _tcsSvrMean = [
    3459.7615,
    3488.3833,
    3429.0234,
    3460.9052,
    2688315.8508
  ];
  static const _tcsSvrScale = [
    416.7372,
    422.4238,
    409.0871,
    417.7618,
    1262560.4342
  ];

  Future<List<double>> getPrediction(
      String modelName, List<StockDataPoint> historicalData) async {
    if (historicalData.isEmpty) {
      throw Exception("Cannot predict with no historical data.");
    }
    final lastDataPoint = historicalData.last;

    final rawFeatures = [
      lastDataPoint.open,
      lastDataPoint.high,
      lastDataPoint.low,
      lastDataPoint.close,
      lastDataPoint.volume,
    ];

    double prediction;

    switch (modelName) {
      case 'linear_regression':
        print("Predicting with Dart Linear Regression model...");
        prediction = _linearRegressionModel.score(rawFeatures);
        return List.generate(5, (i) => prediction * (1 + (i * 0.003)));

      case 'svr':
        print("Predicting with Dart SVR model...");
        final List<double> normalizedInputs = [
          (rawFeatures[0] - _tcsSvrMean[0]) / _tcsSvrScale[0],
          (rawFeatures[1] - _tcsSvrMean[1]) / _tcsSvrScale[1],
          (rawFeatures[2] - _tcsSvrMean[2]) / _tcsSvrScale[2],
          (rawFeatures[3] - _tcsSvrMean[3]) / _tcsSvrScale[3],
          (rawFeatures[4] - _tcsSvrMean[4]) / _tcsSvrScale[4],
        ];
        prediction = _svrModel.score(normalizedInputs);
        return List.generate(5, (i) => prediction * (1 - (i * 0.003)));
      case 'random_forest':
        print("Predicting with Dart Random Forest model...");
        prediction = _randomForestModel.score(rawFeatures);
        return List.generate(5, (i) => prediction * (1 + (i * 0.0005)));

      case 'xg_boost':
        // 1. Get the raw output from the model (which is the predicted *change*).
        final rawXgBoostOutput = _xgBoostModel.score(rawFeatures);

        print("--- XGBoost Debug ---");
        print("Last Close Price: ${lastDataPoint.close}");
        print("Raw XGBoost Output (the change): $rawXgBoostOutput");

        // 2. Calculate the final prediction by adding the change to the last closing price.
        prediction = lastDataPoint.close + rawXgBoostOutput;
        print("Final XGBoost Prediction: $prediction");
        print("---------------------");
        return List.generate(5, (i) => prediction);

      default:
        prediction = lastDataPoint.close;
        return List.generate(5, (i) => prediction);
    }
  }

  Future<List<StockForecast>> getBacktestedPredictions(
      String modelName, List<StockDataPoint> historicalData) async {
    final List<StockForecast> backtestPredictions = [];

    // Loop through each historical day to generate a prediction for the next day.
    for (int i = 0; i < historicalData.length - 1; i++) {
      final currentDay = historicalData[i];
      final nextDay = historicalData[i + 1];

      final rawFeatures = [
        currentDay.open,
        currentDay.high,
        currentDay.low,
        currentDay.close,
        currentDay.volume,
      ];

      double predictedValue;

      switch (modelName) {
        case 'linear_regression':
          predictedValue = _linearRegressionModel.score(rawFeatures);
          break;
        case 'svr':
          final normalizedInputs = [
            (rawFeatures[0] - _tcsSvrMean[0]) / _tcsSvrScale[0],
            (rawFeatures[1] - _tcsSvrMean[1]) / _tcsSvrScale[1],
            (rawFeatures[2] - _tcsSvrMean[2]) / _tcsSvrScale[2],
            (rawFeatures[3] - _tcsSvrMean[3]) / _tcsSvrScale[3],
            (rawFeatures[4] - _tcsSvrMean[4]) / _tcsSvrScale[4],
          ];
          predictedValue = _svrModel.score(normalizedInputs);
          break;
        case 'random_forest':
          predictedValue = _randomForestModel.score(rawFeatures);
          break;
        case 'xg_boost':
          final rawXgBoostOutput = _xgBoostModel.score(rawFeatures);
          predictedValue = currentDay.close + rawXgBoostOutput;
          break;
        default:
          predictedValue = currentDay.close; // Fallback to the current price
      }

      if (predictedValue.isNaN || predictedValue.isInfinite) {
        predictedValue = currentDay.close;
      }

      backtestPredictions.add(
        StockForecast(date: nextDay.date, value: predictedValue),
      );
    }

    return backtestPredictions;
  }
}
