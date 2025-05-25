import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/mutual_fund_card/mutual_fund_card.dart';
import '../../data/repositories/watchlist_repository.dart';
part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepository watchlistRepository;
  final SharedPreferences prefs;
  static const _prefix = 'watchlist_';
  WatchlistCubit({required this.watchlistRepository, required this.prefs}) : super(WatchlistInitial());

  void searchMutualFund(String query) {
    if (query.isEmpty) {
      emit(SearchListLoaded(watchlistRepository.mutualFunds));
    } else {
      final filteredMutualFunds = watchlistRepository.searchMutualFund(query);
      emit(SearchListLoaded(filteredMutualFunds));
    }
  }

  void loadWatchlist(String watchList) async {
    emit(WatchlistLoading());
    try {
      final fundIds = await getWatchlist(watchList);
      final mutualFunds = watchlistRepository.mutualFunds.where((mf) => fundIds.contains(mf.id)).toList();
      emit(WatchlistLoaded(mutualFunds));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> addFund(String watchlistName, String fundId) async {
    final key = _prefix + watchlistName;
    final currentList = prefs.getStringList(key) ?? [];
    if (!currentList.contains(fundId)) {
      currentList.add(fundId);
      await prefs.setStringList(key, currentList);
    }
    loadWatchlist(watchlistName);
  }

  Future<void> removeFund(String watchlistName, String fundId) async {
    final key = _prefix + watchlistName;
    final currentList = prefs.getStringList(key) ?? [];
    currentList.remove(fundId);
    await prefs.setStringList(key, currentList);
    loadWatchlist(watchlistName);
  }

  Future<List<String>> getWatchlist(String watchlistName) async {
    final key = _prefix + watchlistName;
    return prefs.getStringList(key) ?? [];
  }

  bool isInWatchlist(String watchlistName, String fundId) {
    final key = _prefix + watchlistName;
    final currentList = prefs.getStringList(key) ?? [];
    return currentList.contains(fundId);
  }

  Future<List<String>> getAllWatchlistNames() async {
    List<String> res = prefs.getKeys().where((key) => key.startsWith(_prefix)).map((key) => key.replaceFirst(_prefix, '')).toList();
    loadWatchlist(res.isNotEmpty ? res[0] : '');
    emit(WatchlistsUpdated(res));
    return res;
  }

  Future<void> createWatchlist(String watchlistName) async {
    final key = _prefix + watchlistName;

    if (!prefs.containsKey(key)) {
      await prefs.setStringList(key, []);
    }
    getAllWatchlistNames();
  }

  Future<void> deleteWatchlist(String watchlistName) async {
    final key = _prefix + watchlistName;
    await prefs.remove(key);
  }

  Future<void> renameWatchlist(String oldName, String newName) async {
    final oldKey = _prefix + oldName;
    final newKey = _prefix + newName;

    if (prefs.containsKey(oldKey)) {
      final funds = prefs.getStringList(oldKey);
      await prefs.setStringList(newKey, funds ?? []);
      await prefs.remove(oldKey);
    }
  }
}
