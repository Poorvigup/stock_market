import 'package:auravest/src/domain/entities/stock_data_point.dart';

abstract class StockRepository {
  Future<List<StockDataPoint>> getStockData(String symbol);
}