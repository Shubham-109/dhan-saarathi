import 'package:freezed_annotation/freezed_annotation.dart';
part 'mutual_fund_card.freezed.dart';
part 'mutual_fund_card.g.dart';

@freezed
class MutualFundCard with _$MutualFundCard {
  const factory MutualFundCard({
    String? id,
    String? name,
    String? image,
    String? category,
    double? nav,
    double? dayChange,
    double? oneYearReturn,
    double? fiveYearReturn,
    double? threeYearReturn,
    double? expRatio,
  }) = _MutualFundCard;

  factory MutualFundCard.fromJson(Map<String, dynamic> json) => _$MutualFundCardFromJson(json);
}
