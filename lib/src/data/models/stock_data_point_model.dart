import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_data_point_model.freezed.dart';
part 'stock_data_point_model.g.dart';

@freezed
class StockDataPointModel with _$StockDataPointModel {
  factory StockDataPointModel({
    // Add the date field to capture the date from the API response
    required String date,
    @JsonKey(name: '1. open') required String open,
    @JsonKey(name: '2. high') required String high,
    @JsonKey(name: '3. low') required String low,
    @JsonKey(name: '4. close') required String close,
    @JsonKey(name: '5. volume') required String volume,
  }) = _StockDataPointModel;

  factory StockDataPointModel.fromJson(Map<String, dynamic> json) =>
      _$StockDataPointModelFromJson(json);
}