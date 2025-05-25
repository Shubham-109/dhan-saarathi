import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../../../../core/index.dart';
import '../../../../../cubits/watchlist/watchlist_cubit.dart';
import '../../../../../data/models/mutual_fund_card/mutual_fund_card.dart';

class MutualFundSearchedList extends StatelessWidget {
  final List<MutualFundCard> funds;
  final ValueChanged<String> onSearch;
  final String watchlistName;
  final void Function(MutualFundCard fund) onTap;
  final void Function(MutualFundCard fund) onBookmarkTap;

  const MutualFundSearchedList({
    super.key,
    required this.funds,
    required this.onSearch,
    required this.watchlistName,
    required this.onTap,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            onChanged: onSearch,
            decoration: InputDecoration(
              hintText: 'Search for Mutual Funds, AMC, Fund Managers...',
              hintStyle: TextStyles.textStyle_11_400,
              prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.onPrimary),
              filled: true,
              fillColor: const Color(0xff292934),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: funds.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final fund = funds[index];
              bool isAdded = context.read<WatchlistCubit>().isInWatchlist(watchlistName, fund.id.toString());
              return InkWell(
                onTap: () => onTap(fund),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(width: 35, height: 35, child: Image.asset(fund.image ?? '-', width: 35, height: 35, fit: BoxFit.cover)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  title: Text(fund.name ?? '-', style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(color: Theme.of(context).colorScheme.onSecondary.withAlpha(150), width: 0.2),
                  ),
                  trailing: GestureDetector(
                    onTap: () => onBookmarkTap(fund),
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(isAdded ? AppConstants.bookmarkAddedIcon : AppConstants.addBookmarkIcon, width: 40, height: 40),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
