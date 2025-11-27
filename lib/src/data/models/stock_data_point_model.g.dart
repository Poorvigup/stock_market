// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockDataPointModelImpl _$$StockDataPointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StockDataPointModelImpl(
      date: json['date'] as String,
      open: json['1. open'] as String,
      high: json['2. high'] as String,
      low: json['3. low'] as String,
      close: json['4. close'] as String,
      volume: json['5. volume'] as String,
    );

Map<String, dynamic> _$$StockDataPointModelImplToJson(
        _$StockDataPointModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      '1. open': instance.open,
      '2. high': instance.high,
      '3. low': instance.low,
      '4. close': instance.close,
      '5. volume': instance.volume,
    };
