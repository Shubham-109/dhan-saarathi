// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'mutual_fund_response.freezed.dart';
part 'mutual_fund_response.g.dart';

@freezed
class MutualFundResponse with _$MutualFundResponse {
  const factory MutualFundResponse({required Meta meta, required List<NavData> data, required String status}) = _MutualFundResponse;

  factory MutualFundResponse.fromJson(Map<String, dynamic> json) => _$MutualFundResponseFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'fund_house') required String fundHouse,
    @JsonKey(name: 'scheme_type') required String schemeType,
    @JsonKey(name: 'scheme_category') required String schemeCategory,
    @JsonKey(name: 'scheme_code') required int schemeCode,
    @JsonKey(name: 'scheme_name') required String schemeName,
    @JsonKey(name: 'isin_growth') required String isinGrowth,
    @JsonKey(name: 'isin_div_reinvestment') String? isinDivReinvestment,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class NavData with _$NavData {
  const factory NavData({required String date, required String nav}) = _NavData;

  factory NavData.fromJson(Map<String, dynamic> json) => _$NavDataFromJson(json);
}
