part of 'charts_cubit.dart';

abstract class ChartsState {}

class ChartsInitial extends ChartsState {}

class ChartsLoading extends ChartsState {}

class MutualFundLoaded extends ChartsState {
  final List<NavData> navData;
  final List<NavData> fullData;
  final Meta meta;
  final String latestNav;
  final String filter;

  MutualFundLoaded({required this.navData, required this.fullData, required this.meta, required this.filter, required this.latestNav});

  MutualFundLoaded copyWith({List<NavData>? navData, List<NavData>? fullData, Meta? meta, String? filter}) {
    return MutualFundLoaded(
      navData: navData ?? this.navData,
      fullData: fullData ?? this.fullData,
      meta: meta ?? this.meta,
      filter: filter ?? this.filter,
      latestNav: latestNav,
    );
  }
}

class ChartsEventsLoading extends ChartsState {}

class ChartsError extends ChartsState {
  final String message;
  ChartsError(this.message);
}
