import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khazana/cubits/charts/charts_cubit.dart';
import 'package:khazana/cubits/watchlist/watchlist_cubit.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../core/index.dart';
import '../../../../data/models/mutual_fund_card/mutual_fund_card.dart';
import 'widgets/add_mutual_fund_button.dart';
import 'widgets/add_watchlist_button.dart';
import 'widgets/mutual_fund_list.dart';
import 'widgets/search_mutual_fund_widget.dart';
import 'widgets/watchlist_tab_button.dart';

class WatchlistScreen extends StatefulWidget {
  final VoidCallback onTapMFFund;
  const WatchlistScreen({super.key, required this.onTapMFFund});
  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int selectedTab = 0;
  final tabs = [];
  bool showSearchPage = false;
  List<MutualFundCard> searchedMutualFunds = [];
  List<MutualFundCard> mutualFundList = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    final watchlistList = await context.read<WatchlistCubit>().getAllWatchlistNames();
    tabs.clear();
    tabs.addAll(watchlistList);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<WatchlistCubit, WatchlistState>(
          listener: (context, state) {
            if (state is WatchlistError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.red));
            } else if (state is SearchListLoaded) {
              searchedMutualFunds.clear();
              searchedMutualFunds = state.mutualFunds;
            } else if (state is WatchlistLoaded) {
              print("Watchlist Loaded: ${state.mutualFunds}");
              mutualFundList = state.mutualFunds;
            } else if (state is WatchlistsUpdated) {
              tabs.clear();
              tabs.addAll(state.watchlists);
            }
          },
          builder: (context, state) {
            if (state is WatchlistLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 12, 12),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => widget.onTapMFFund(),
                        icon: Icon(Icons.arrow_back, size: 25, color: Theme.of(context).primaryColor),
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text("Watchlist", style: TextStyles.textStyle_20_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: List.generate(tabs.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: WatchlistTabButton(
                          label: tabs[index],
                          isSelected: index == selectedTab,
                          onTap:
                              () => setState(() {
                                showSearchPage = false;
                                selectedTab = index;
                                mutualFundList.clear();
                                context.read<WatchlistCubit>().loadWatchlist(tabs[selectedTab]);
                              }),
                        ),
                      );
                    }),
                  ),
                ),
                showSearchPage
                    ? Expanded(
                      child: MutualFundSearchedList(
                        funds: searchedMutualFunds,
                        onSearch: (query) {
                          context.read<WatchlistCubit>().searchMutualFund(query);
                        },
                        watchlistName: tabs[selectedTab],
                        onTap: (fund) {},
                        onBookmarkTap: (fund) {
                          if (context.read<WatchlistCubit>().isInWatchlist(tabs[selectedTab], fund.id.toString())) {
                            context.read<WatchlistCubit>().removeFund(tabs[selectedTab], fund.id.toString());
                          } else {
                            context.read<WatchlistCubit>().addFund(tabs[selectedTab], fund.id.toString());
                          }
                          setState(() {
                            showSearchPage = false;
                          });
                        },
                      ),
                    )
                    : mutualFundList.isNotEmpty
                    ? Expanded(
                      child: MutualFundList(
                        watchlist: tabs[selectedTab],
                        funds: mutualFundList,
                        addMutualFund:
                            () => setState(() {
                              showSearchPage = true;
                            }),
                        onTap: (fund) {
                          context.read<ChartsCubit>().fetchFund(fund);
                          widget.onTapMFFund();
                        },
                      ),
                    )
                    : tabs.isEmpty
                    ? SizedBox()
                    : Column(
                      children: [
                        SizedBox(height: MediaQuery.sizeOf(context).width * .6),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SvgPicture.asset(AppConstants.chartSearchIcon, width: MediaQuery.sizeOf(context).width * .15),
                              SizedBox(height: 16),
                              Text("Looks like your watchlist is empty.", style: TextStyles.textStyle_14_400),
                              SizedBox(height: 20),
                              AddMutualFundsButton(onPressed: () => setState(() => showSearchPage = true)),
                            ],
                          ),
                        ),
                      ],
                    ),
              ],
            );
          },
        ),

        const Positioned(bottom: 24, right: 24, child: FloatingWatchlistButton()),
      ],
    );
  }
}
