// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_data_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockDataPointModel _$StockDataPointModelFromJson(Map<String, dynamic> json) {
  return _StockDataPointModel.fromJson(json);
}

/// @nodoc
mixin _$StockDataPointModel {
// Add the date field to capture the date from the API response
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: '1. open')
  String get open => throw _privateConstructorUsedError;
  @JsonKey(name: '2. high')
  String get high => throw _privateConstructorUsedError;
  @JsonKey(name: '3. low')
  String get low => throw _privateConstructorUsedError;
  @JsonKey(name: '4. close')
  String get close => throw _privateConstructorUsedError;
  @JsonKey(name: '5. volume')
  String get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockDataPointModelCopyWith<StockDataPointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDataPointModelCopyWith<$Res> {
  factory $StockDataPointModelCopyWith(
          StockDataPointModel value, $Res Function(StockDataPointModel) then) =
      _$StockDataPointModelCopyWithImpl<$Res, StockDataPointModel>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: '1. open') String open,
      @JsonKey(name: '2. high') String high,
      @JsonKey(name: '3. low') String low,
      @JsonKey(name: '4. close') String close,
      @JsonKey(name: '5. volume') String volume});
}

/// @nodoc
class _$StockDataPointModelCopyWithImpl<$Res, $Val extends StockDataPointModel>
    implements $StockDataPointModelCopyWith<$Res> {
  _$StockDataPointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as String,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockDataPointModelImplCopyWith<$Res>
    implements $StockDataPointModelCopyWith<$Res> {
  factory _$$StockDataPointModelImplCopyWith(_$StockDataPointModelImpl value,
          $Res Function(_$StockDataPointModelImpl) then) =
      __$$StockDataPointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: '1. open') String open,
      @JsonKey(name: '2. high') String high,
      @JsonKey(name: '3. low') String low,
      @JsonKey(name: '4. close') String close,
      @JsonKey(name: '5. volume') String volume});
}

/// @nodoc
class __$$StockDataPointModelImplCopyWithImpl<$Res>
    extends _$StockDataPointModelCopyWithImpl<$Res, _$StockDataPointModelImpl>
    implements _$$StockDataPointModelImplCopyWith<$Res> {
  __$$StockDataPointModelImplCopyWithImpl(_$StockDataPointModelImpl _value,
      $Res Function(_$StockDataPointModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_$StockDataPointModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as String,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockDataPointModelImpl implements _StockDataPointModel {
  _$StockDataPointModelImpl(
      {required this.date,
      @JsonKey(name: '1. open') required this.open,
      @JsonKey(name: '2. high') required this.high,
      @JsonKey(name: '3. low') required this.low,
      @JsonKey(name: '4. close') required this.close,
      @JsonKey(name: '5. volume') required this.volume});

  factory _$StockDataPointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockDataPointModelImplFromJson(json);

// Add the date field to capture the date from the API response
  @override
  final String date;
  @override
  @JsonKey(name: '1. open')
  final String open;
  @override
  @JsonKey(name: '2. high')
  final String high;
  @override
  @JsonKey(name: '3. low')
  final String low;
  @override
  @JsonKey(name: '4. close')
  final String close;
  @override
  @JsonKey(name: '5. volume')
  final String volume;

  @override
  String toString() {
    return 'StockDataPointModel(date: $date, open: $open, high: $high, low: $low, close: $close, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDataPointModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, open, high, low, close, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDataPointModelImplCopyWith<_$StockDataPointModelImpl> get copyWith =>
      __$$StockDataPointModelImplCopyWithImpl<_$StockDataPointModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockDataPointModelImplToJson(
      this,
    );
  }
}

abstract class _StockDataPointModel implements StockDataPointModel {
  factory _StockDataPointModel(
          {required final String date,
          @JsonKey(name: '1. open') required final String open,
          @JsonKey(name: '2. high') required final String high,
          @JsonKey(name: '3. low') required final String low,
          @JsonKey(name: '4. close') required final String close,
          @JsonKey(name: '5. volume') required final String volume}) =
      _$StockDataPointModelImpl;

  factory _StockDataPointModel.fromJson(Map<String, dynamic> json) =
      _$StockDataPointModelImpl.fromJson;

  @override // Add the date field to capture the date from the API response
  String get date;
  @override
  @JsonKey(name: '1. open')
  String get open;
  @override
  @JsonKey(name: '2. high')
  String get high;
  @override
  @JsonKey(name: '3. low')
  String get low;
  @override
  @JsonKey(name: '4. close')
  String get close;
  @override
  @JsonKey(name: '5. volume')
  String get volume;
  @override
  @JsonKey(ignore: true)
  _$$StockDataPointModelImplCopyWith<_$StockDataPointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
