// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutual_fund_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MutualFundResponse _$MutualFundResponseFromJson(Map<String, dynamic> json) {
  return _MutualFundResponse.fromJson(json);
}

/// @nodoc
mixin _$MutualFundResponse {
  Meta get meta => throw _privateConstructorUsedError;
  List<NavData> get data => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this MutualFundResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MutualFundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MutualFundResponseCopyWith<MutualFundResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutualFundResponseCopyWith<$Res> {
  factory $MutualFundResponseCopyWith(
          MutualFundResponse value, $Res Function(MutualFundResponse) then) =
      _$MutualFundResponseCopyWithImpl<$Res, MutualFundResponse>;
  @useResult
  $Res call({Meta meta, List<NavData> data, String status});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$MutualFundResponseCopyWithImpl<$Res, $Val extends MutualFundResponse>
    implements $MutualFundResponseCopyWith<$Res> {
  _$MutualFundResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MutualFundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NavData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of MutualFundResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MutualFundResponseImplCopyWith<$Res>
    implements $MutualFundResponseCopyWith<$Res> {
  factory _$$MutualFundResponseImplCopyWith(_$MutualFundResponseImpl value,
          $Res Function(_$MutualFundResponseImpl) then) =
      __$$MutualFundResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meta meta, List<NavData> data, String status});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$MutualFundResponseImplCopyWithImpl<$Res>
    extends _$MutualFundResponseCopyWithImpl<$Res, _$MutualFundResponseImpl>
    implements _$$MutualFundResponseImplCopyWith<$Res> {
  __$$MutualFundResponseImplCopyWithImpl(_$MutualFundResponseImpl _value,
      $Res Function(_$MutualFundResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MutualFundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$MutualFundResponseImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NavData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MutualFundResponseImpl implements _MutualFundResponse {
  const _$MutualFundResponseImpl(
      {required this.meta,
      required final List<NavData> data,
      required this.status})
      : _data = data;

  factory _$MutualFundResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MutualFundResponseImplFromJson(json);

  @override
  final Meta meta;
  final List<NavData> _data;
  @override
  List<NavData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String status;

  @override
  String toString() {
    return 'MutualFundResponse(meta: $meta, data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutualFundResponseImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_data), status);

  /// Create a copy of MutualFundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutualFundResponseImplCopyWith<_$MutualFundResponseImpl> get copyWith =>
      __$$MutualFundResponseImplCopyWithImpl<_$MutualFundResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MutualFundResponseImplToJson(
      this,
    );
  }
}

abstract class _MutualFundResponse implements MutualFundResponse {
  const factory _MutualFundResponse(
      {required final Meta meta,
      required final List<NavData> data,
      required final String status}) = _$MutualFundResponseImpl;

  factory _MutualFundResponse.fromJson(Map<String, dynamic> json) =
      _$MutualFundResponseImpl.fromJson;

  @override
  Meta get meta;
  @override
  List<NavData> get data;
  @override
  String get status;

  /// Create a copy of MutualFundResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutualFundResponseImplCopyWith<_$MutualFundResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'fund_house')
  String get fundHouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheme_type')
  String get schemeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheme_category')
  String get schemeCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheme_code')
  int get schemeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheme_name')
  String get schemeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'isin_growth')
  String get isinGrowth => throw _privateConstructorUsedError;
  @JsonKey(name: 'isin_div_reinvestment')
  String? get isinDivReinvestment => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fund_house') String fundHouse,
      @JsonKey(name: 'scheme_type') String schemeType,
      @JsonKey(name: 'scheme_category') String schemeCategory,
      @JsonKey(name: 'scheme_code') int schemeCode,
      @JsonKey(name: 'scheme_name') String schemeName,
      @JsonKey(name: 'isin_growth') String isinGrowth,
      @JsonKey(name: 'isin_div_reinvestment') String? isinDivReinvestment});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fundHouse = null,
    Object? schemeType = null,
    Object? schemeCategory = null,
    Object? schemeCode = null,
    Object? schemeName = null,
    Object? isinGrowth = null,
    Object? isinDivReinvestment = freezed,
  }) {
    return _then(_value.copyWith(
      fundHouse: null == fundHouse
          ? _value.fundHouse
          : fundHouse // ignore: cast_nullable_to_non_nullable
              as String,
      schemeType: null == schemeType
          ? _value.schemeType
          : schemeType // ignore: cast_nullable_to_non_nullable
              as String,
      schemeCategory: null == schemeCategory
          ? _value.schemeCategory
          : schemeCategory // ignore: cast_nullable_to_non_nullable
              as String,
      schemeCode: null == schemeCode
          ? _value.schemeCode
          : schemeCode // ignore: cast_nullable_to_non_nullable
              as int,
      schemeName: null == schemeName
          ? _value.schemeName
          : schemeName // ignore: cast_nullable_to_non_nullable
              as String,
      isinGrowth: null == isinGrowth
          ? _value.isinGrowth
          : isinGrowth // ignore: cast_nullable_to_non_nullable
              as String,
      isinDivReinvestment: freezed == isinDivReinvestment
          ? _value.isinDivReinvestment
          : isinDivReinvestment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fund_house') String fundHouse,
      @JsonKey(name: 'scheme_type') String schemeType,
      @JsonKey(name: 'scheme_category') String schemeCategory,
      @JsonKey(name: 'scheme_code') int schemeCode,
      @JsonKey(name: 'scheme_name') String schemeName,
      @JsonKey(name: 'isin_growth') String isinGrowth,
      @JsonKey(name: 'isin_div_reinvestment') String? isinDivReinvestment});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fundHouse = null,
    Object? schemeType = null,
    Object? schemeCategory = null,
    Object? schemeCode = null,
    Object? schemeName = null,
    Object? isinGrowth = null,
    Object? isinDivReinvestment = freezed,
  }) {
    return _then(_$MetaImpl(
      fundHouse: null == fundHouse
          ? _value.fundHouse
          : fundHouse // ignore: cast_nullable_to_non_nullable
              as String,
      schemeType: null == schemeType
          ? _value.schemeType
          : schemeType // ignore: cast_nullable_to_non_nullable
              as String,
      schemeCategory: null == schemeCategory
          ? _value.schemeCategory
          : schemeCategory // ignore: cast_nullable_to_non_nullable
              as String,
      schemeCode: null == schemeCode
          ? _value.schemeCode
          : schemeCode // ignore: cast_nullable_to_non_nullable
              as int,
      schemeName: null == schemeName
          ? _value.schemeName
          : schemeName // ignore: cast_nullable_to_non_nullable
              as String,
      isinGrowth: null == isinGrowth
          ? _value.isinGrowth
          : isinGrowth // ignore: cast_nullable_to_non_nullable
              as String,
      isinDivReinvestment: freezed == isinDivReinvestment
          ? _value.isinDivReinvestment
          : isinDivReinvestment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {@JsonKey(name: 'fund_house') required this.fundHouse,
      @JsonKey(name: 'scheme_type') required this.schemeType,
      @JsonKey(name: 'scheme_category') required this.schemeCategory,
      @JsonKey(name: 'scheme_code') required this.schemeCode,
      @JsonKey(name: 'scheme_name') required this.schemeName,
      @JsonKey(name: 'isin_growth') required this.isinGrowth,
      @JsonKey(name: 'isin_div_reinvestment') this.isinDivReinvestment});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: 'fund_house')
  final String fundHouse;
  @override
  @JsonKey(name: 'scheme_type')
  final String schemeType;
  @override
  @JsonKey(name: 'scheme_category')
  final String schemeCategory;
  @override
  @JsonKey(name: 'scheme_code')
  final int schemeCode;
  @override
  @JsonKey(name: 'scheme_name')
  final String schemeName;
  @override
  @JsonKey(name: 'isin_growth')
  final String isinGrowth;
  @override
  @JsonKey(name: 'isin_div_reinvestment')
  final String? isinDivReinvestment;

  @override
  String toString() {
    return 'Meta(fundHouse: $fundHouse, schemeType: $schemeType, schemeCategory: $schemeCategory, schemeCode: $schemeCode, schemeName: $schemeName, isinGrowth: $isinGrowth, isinDivReinvestment: $isinDivReinvestment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.fundHouse, fundHouse) ||
                other.fundHouse == fundHouse) &&
            (identical(other.schemeType, schemeType) ||
                other.schemeType == schemeType) &&
            (identical(other.schemeCategory, schemeCategory) ||
                other.schemeCategory == schemeCategory) &&
            (identical(other.schemeCode, schemeCode) ||
                other.schemeCode == schemeCode) &&
            (identical(other.schemeName, schemeName) ||
                other.schemeName == schemeName) &&
            (identical(other.isinGrowth, isinGrowth) ||
                other.isinGrowth == isinGrowth) &&
            (identical(other.isinDivReinvestment, isinDivReinvestment) ||
                other.isinDivReinvestment == isinDivReinvestment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fundHouse, schemeType,
      schemeCategory, schemeCode, schemeName, isinGrowth, isinDivReinvestment);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {@JsonKey(name: 'fund_house') required final String fundHouse,
      @JsonKey(name: 'scheme_type') required final String schemeType,
      @JsonKey(name: 'scheme_category') required final String schemeCategory,
      @JsonKey(name: 'scheme_code') required final int schemeCode,
      @JsonKey(name: 'scheme_name') required final String schemeName,
      @JsonKey(name: 'isin_growth') required final String isinGrowth,
      @JsonKey(name: 'isin_div_reinvestment')
      final String? isinDivReinvestment}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: 'fund_house')
  String get fundHouse;
  @override
  @JsonKey(name: 'scheme_type')
  String get schemeType;
  @override
  @JsonKey(name: 'scheme_category')
  String get schemeCategory;
  @override
  @JsonKey(name: 'scheme_code')
  int get schemeCode;
  @override
  @JsonKey(name: 'scheme_name')
  String get schemeName;
  @override
  @JsonKey(name: 'isin_growth')
  String get isinGrowth;
  @override
  @JsonKey(name: 'isin_div_reinvestment')
  String? get isinDivReinvestment;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NavData _$NavDataFromJson(Map<String, dynamic> json) {
  return _NavData.fromJson(json);
}

/// @nodoc
mixin _$NavData {
  String get date => throw _privateConstructorUsedError;
  String get nav => throw _privateConstructorUsedError;

  /// Serializes this NavData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NavData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NavDataCopyWith<NavData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavDataCopyWith<$Res> {
  factory $NavDataCopyWith(NavData value, $Res Function(NavData) then) =
      _$NavDataCopyWithImpl<$Res, NavData>;
  @useResult
  $Res call({String date, String nav});
}

/// @nodoc
class _$NavDataCopyWithImpl<$Res, $Val extends NavData>
    implements $NavDataCopyWith<$Res> {
  _$NavDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? nav = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      nav: null == nav
          ? _value.nav
          : nav // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavDataImplCopyWith<$Res> implements $NavDataCopyWith<$Res> {
  factory _$$NavDataImplCopyWith(
          _$NavDataImpl value, $Res Function(_$NavDataImpl) then) =
      __$$NavDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String nav});
}

/// @nodoc
class __$$NavDataImplCopyWithImpl<$Res>
    extends _$NavDataCopyWithImpl<$Res, _$NavDataImpl>
    implements _$$NavDataImplCopyWith<$Res> {
  __$$NavDataImplCopyWithImpl(
      _$NavDataImpl _value, $Res Function(_$NavDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NavData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? nav = null,
  }) {
    return _then(_$NavDataImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      nav: null == nav
          ? _value.nav
          : nav // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavDataImpl implements _NavData {
  const _$NavDataImpl({required this.date, required this.nav});

  factory _$NavDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavDataImplFromJson(json);

  @override
  final String date;
  @override
  final String nav;

  @override
  String toString() {
    return 'NavData(date: $date, nav: $nav)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.nav, nav) || other.nav == nav));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, nav);

  /// Create a copy of NavData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavDataImplCopyWith<_$NavDataImpl> get copyWith =>
      __$$NavDataImplCopyWithImpl<_$NavDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavDataImplToJson(
      this,
    );
  }
}

abstract class _NavData implements NavData {
  const factory _NavData(
      {required final String date, required final String nav}) = _$NavDataImpl;

  factory _NavData.fromJson(Map<String, dynamic> json) = _$NavDataImpl.fromJson;

  @override
  String get date;
  @override
  String get nav;

  /// Create a copy of NavData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavDataImplCopyWith<_$NavDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
