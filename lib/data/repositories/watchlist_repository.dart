// ignore_for_file: unused_field

import 'package:khazana/core/index.dart';
import 'package:khazana/data/models/mutual_fund_card/mutual_fund_card.dart';

import '../../core/network/api_service.dart';

class WatchlistRepository {
  final ApiService _apiService;
  WatchlistRepository({required apiService}) : _apiService = apiService;

  List<MutualFundCard> mutualFunds = [
    MutualFundCard(
      id: '100119',
      name: 'HDFC Balanced Advantage Fund - Growth Plan',
      image: AppConstants.hdfcMFLogo,
      category: 'Balanced Advantage',
      nav: 19.57,
      dayChange: 3.39,
      oneYearReturn: 111.8,
      fiveYearReturn: 202.2,
      threeYearReturn: 225.5,
      expRatio: 0.35,
    ),
    MutualFundCard(
      id: '150915',
      name: 'Mahindra Manulife Small Cap Fund - Direct Plan - Growth',
      image: AppConstants.mahindraMFLogo,
      category: 'Small Cap',
      nav: 8.57,
      dayChange: 2.39,
      oneYearReturn: 26.8,
      fiveYearReturn: 98.2,
      threeYearReturn: 215.5,
      expRatio: 0.35,
    ),
    MutualFundCard(
      id: '148381',
      name: 'Motilal Oswal S&P 500 Index Fund - Direct Plan Growth',
      image: AppConstants.motilalMFLogo,
      category: 'Index Fund',
      nav: 21.98,
      dayChange: 1.93,
      oneYearReturn: 41.8,
      fiveYearReturn: 70.2,
      threeYearReturn: 95.5,
      expRatio: 0.85,
    ),
    MutualFundCard(
      id: '122639',
      name: 'Parag Parikh Flexi Cap Fund - Direct Plan - Growth',
      image: AppConstants.paragMFLogo,
      category: 'Flexi Cap',
      nav: 76.57,
      dayChange: 7.39,
      oneYearReturn: 31.8,
      fiveYearReturn: 70.2,
      threeYearReturn: 98.5,
      expRatio: 0.29,
    ),
    MutualFundCard(
      id: '134643',
      name: 'SBI Equity Savings Fund - Direct Plan - Growth',
      image: AppConstants.sbiMFLogo,
      category: 'Equity Savings',
      nav: 43.7,
      dayChange: 6.39,
      oneYearReturn: 41.8,
      fiveYearReturn: 30.2,
      threeYearReturn: 225.5,
      expRatio: 0.35,
    ),
  ];

  List<MutualFundCard> searchMutualFund(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return mutualFunds.where((mutualFund) => mutualFund.name!.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }
}
