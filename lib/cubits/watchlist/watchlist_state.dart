part of 'watchlist_cubit.dart';

abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class SearchListLoaded extends WatchlistState {
  final List<MutualFundCard> mutualFunds;
  SearchListLoaded(this.mutualFunds);
}

class WatchlistLoaded extends WatchlistState {
  final List<MutualFundCard> mutualFunds;
  WatchlistLoaded(this.mutualFunds);
}

class WatchlistsUpdated extends WatchlistState {
  final List<String> watchlists;
  WatchlistsUpdated(this.watchlists);
}

class WatchlistError extends WatchlistState {
  final String message;
  WatchlistError(this.message);
}
