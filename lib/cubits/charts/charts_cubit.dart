import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/mutual_fund_response/mutual_fund_response.dart';
import '../../data/repositories/charts_repository.dart';
part 'charts_state.dart';

class ChartsCubit extends Cubit<ChartsState> {
  final ChartsRepository chartsRepository;
  String currentFilter = 'MAX';
  ChartsCubit({required this.chartsRepository}) : super(ChartsInitial());

  Future<void> fetchFund(String mfId, [String filter = 'MAX']) async {
    emit(ChartsLoading());
    currentFilter = 'MAX';
    try {
      final response = await chartsRepository.getMutualFundNavData(mfId);
      final filtered = NavFilterHelper.filterByOption(response.data, filter);
      final latestNav = response.data.isNotEmpty ? response.data.last.nav.toString() : '0.0';
      emit(MutualFundLoaded(navData: filtered, fullData: response.data, meta: response.meta, filter: filter, latestNav: latestNav));
    } catch (e) {
      emit(ChartsError(e.toString()));
    }
  }

  void updateFilter(String filter) {
    if (state is MutualFundLoaded) {
      currentFilter = filter;
      final current = state as MutualFundLoaded;
      emit(ChartsEventsLoading());
      final filtered = NavFilterHelper.filterByOption(current.fullData, filter);
      emit(current.copyWith(navData: filtered, filter: filter));
    }
  }
}
