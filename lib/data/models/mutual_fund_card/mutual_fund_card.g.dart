// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutual_fund_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MutualFundCardImpl _$$MutualFundCardImplFromJson(Map<String, dynamic> json) =>
    _$MutualFundCardImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      category: json['category'] as String?,
      nav: (json['nav'] as num?)?.toDouble(),
      dayChange: (json['dayChange'] as num?)?.toDouble(),
      oneYearReturn: (json['oneYearReturn'] as num?)?.toDouble(),
      fiveYearReturn: (json['fiveYearReturn'] as num?)?.toDouble(),
      threeYearReturn: (json['threeYearReturn'] as num?)?.toDouble(),
      expRatio: (json['expRatio'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MutualFundCardImplToJson(
        _$MutualFundCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'category': instance.category,
      'nav': instance.nav,
      'dayChange': instance.dayChange,
      'oneYearReturn': instance.oneYearReturn,
      'fiveYearReturn': instance.fiveYearReturn,
      'threeYearReturn': instance.threeYearReturn,
      'expRatio': instance.expRatio,
    };
