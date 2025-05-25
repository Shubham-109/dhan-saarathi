import 'package:flutter/material.dart';
import 'package:khazana/data/models/mutual_fund_card/mutual_fund_card.dart';
import 'add_mutual_fund_text_button.dart';
import 'mutual_fund_detail_card.dart';

class MutualFundList extends StatelessWidget {
  final List<MutualFundCard> funds;
  final Function(String) onTap;
  final Function addMutualFund;
  final String watchlist;
  const MutualFundList({super.key, required this.watchlist, required this.funds, required this.onTap, required this.addMutualFund});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddMutualFundsTextButton(onPressed: () => addMutualFund()),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: funds.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final fund = funds[index];
              return MutualFundDetailCard(
                mfID: fund.id ?? '0',
                watchlist: watchlist,
                title: fund.name ?? "-",
                subtitle: fund.category ?? "-",
                nav: fund.nav.toString(),
                dayChange: fund.dayChange.toString(),
                oneYear: fund.oneYearReturn.toString(),
                threeYear: fund.threeYearReturn.toString(),
                fiveYear: fund.fiveYearReturn.toString(),
                expRatio: fund.expRatio.toString(),
                onTap: () => onTap(fund.id ?? '0'),
              );
            },
          ),
        ),
      ],
    );
  }
}
