// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutual_fund_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MutualFundResponseImpl _$$MutualFundResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MutualFundResponseImpl(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NavData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$MutualFundResponseImplToJson(
        _$MutualFundResponseImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
      'status': instance.status,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      fundHouse: json['fund_house'] as String,
      schemeType: json['scheme_type'] as String,
      schemeCategory: json['scheme_category'] as String,
      schemeCode: (json['scheme_code'] as num).toInt(),
      schemeName: json['scheme_name'] as String,
      isinGrowth: json['isin_growth'] as String,
      isinDivReinvestment: json['isin_div_reinvestment'] as String?,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'fund_house': instance.fundHouse,
      'scheme_type': instance.schemeType,
      'scheme_category': instance.schemeCategory,
      'scheme_code': instance.schemeCode,
      'scheme_name': instance.schemeName,
      'isin_growth': instance.isinGrowth,
      'isin_div_reinvestment': instance.isinDivReinvestment,
    };

_$NavDataImpl _$$NavDataImplFromJson(Map<String, dynamic> json) =>
    _$NavDataImpl(
      date: json['date'] as String,
      nav: json['nav'] as String,
    );

Map<String, dynamic> _$$NavDataImplToJson(_$NavDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'nav': instance.nav,
    };
