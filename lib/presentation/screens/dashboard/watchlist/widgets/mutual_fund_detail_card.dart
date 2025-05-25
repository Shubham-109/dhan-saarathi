import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

import '../../../../../core/index.dart';
import '../../../../../cubits/watchlist/watchlist_cubit.dart';

class MutualFundDetailCard extends StatelessWidget {
  final String mfID;
  final String watchlist;
  final String title;
  final String subtitle;
  final String nav;
  final String dayChange;
  final String oneYear;
  final String threeYear;
  final String fiveYear;
  final String expRatio;
  final VoidCallback? onTap;

  const MutualFundDetailCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.nav,
    required this.dayChange,
    required this.oneYear,
    required this.threeYear,
    required this.fiveYear,
    required this.expRatio,
    required this.onTap,
    required this.mfID,
    required this.watchlist,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SwipeActionCell(
        key: ValueKey(title),
        trailingActions: [
          SwipeAction(
            title: 'Remove',
            style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            onTap: (handler) async {
              context.read<WatchlistCubit>().removeFund(watchlist, mfID);
              handler(true);
            },
            color: Theme.of(context).colorScheme.tertiary,
            icon: const Icon(Icons.delete_outline, color: Colors.white),
          ),
        ],
        child: Card(
          color: const Color(0xFF262626),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Theme.of(context).colorScheme.onSecondary, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(subtitle, style: TextStyles.textStyle_12_400),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'NAV',
                            style: TextStyles.textStyle_14_400,
                            children: [
                              TextSpan(text: ' ₹$nav', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            text: '1D',
                            style: TextStyles.textStyle_12_400,
                            children: [
                              TextSpan(
                                text: ' $dayChange%',
                                style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(color: Theme.of(context).colorScheme.onSecondary, thickness: 0.5),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _returnLabel('1Y', oneYear, context),
                    _returnLabel('3Y', threeYear, context),
                    _returnLabel('5Y', fiveYear, context),
                    RichText(
                      text: TextSpan(
                        text: 'Exp. Ratio',
                        style: TextStyles.textStyle_12_400,
                        children: [
                          TextSpan(text: ' $expRatio%', style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _returnLabel(String label, String value, BuildContext context) {
    return Row(
      children: [
        Text('$label ', style: TextStyles.textStyle_12_400),
        Text("$value%", style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.primary)),
      ],
    );
  }
}
