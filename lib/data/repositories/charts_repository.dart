import 'package:intl/intl.dart';

import '../../core/index.dart';
import '../../core/network/api_service.dart';
import '../models/mutual_fund_response/mutual_fund_response.dart';

class ChartsRepository {
  final ApiService _apiService;
  ChartsRepository({required apiService}) : _apiService = apiService;

  Future<MutualFundResponse> getMutualFundNavData(String mfId) async {
    try {
      final response = await _apiService.getRequest("${Url.getMutualFundData}/$mfId");
      MutualFundResponse mfResponse = MutualFundResponse.fromJson(response);
      final sortedList =
          mfResponse.data.toList()..sort((a, b) => DateFormat('dd-MM-yyyy').parse(a.date).compareTo(DateFormat('dd-MM-yyyy').parse(b.date)));
      mfResponse = mfResponse.copyWith(data: sortedList);
      return mfResponse;
    } catch (e) {
      print("Error fetching mutual fund data: $e");
    }
    return MutualFundResponse(
      meta: Meta(fundHouse: '', schemeType: '', schemeCategory: '', schemeCode: 0, schemeName: '', isinGrowth: '', isinDivReinvestment: ''),
      data: [],
      status: 'error',
    );
  }
}

class NavFilterHelper {
  static List<NavData> filterDataByDuration(List<NavData> data, Duration duration) {
    final now = DateTime.now();
    final fromDate = now.subtract(duration);

    return data.where((navData) {
      final date = DateFormat('dd-MM-yyyy').parse(navData.date);
      return date.isAfter(fromDate);
    }).toList();
  }

  static List<NavData> filterByOption(List<NavData> data, String option) {
    switch (option) {
      case '1M':
        return filterDataByDuration(data, Duration(days: 30));
      case '3M':
        return filterDataByDuration(data, Duration(days: 90));
      case '6M':
        return filterDataByDuration(data, Duration(days: 180));
      case '1Y':
        return filterDataByDuration(data, Duration(days: 365));
      case '3Y':
        return filterDataByDuration(data, Duration(days: 365 * 3));
      case 'MAX':
      default:
        return data;
    }
  }
}
