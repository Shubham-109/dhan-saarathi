import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:khazana/core/index.dart';
import 'dart:math';

import '../../../../cubits/charts/charts_cubit.dart';
import '../../../widgets/custom_text_icon_button.dart';

class ChartsScreen extends StatelessWidget {
  final VoidCallback backCallback;
  const ChartsScreen({super.key, required this.backCallback});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () => backCallback(), icon: Icon(Icons.arrow_back, size: 25, color: Theme.of(context).primaryColor)),
              SizedBox(width: 10),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(),
                SizedBox(height: 16),
                InvestmentSummary(),
                SizedBox(height: 16),
                LineChartSection(),
                SizedBox(height: 12),
                DurationSelector(),
                SizedBox(height: 50),
                InvestmentSimulator(),
                SizedBox(height: 30),
                BottomButtons(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});
  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  String? mfName, latestNav, category, dayChange;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChartsCubit, ChartsState>(
      listener: (context, state) {
        if (state is MutualFundLoaded) {
          final latest = state.navData.last;
          setState(() {
            mfName = state.meta.schemeName;
            latestNav = latest.nav.toString();
            category = state.meta.schemeCategory;
            dayChange = '45.80';
          });
        }
        if (state is ChartsLoading) {
          setState(() {
            mfName = "";
            latestNav = "";
            category = "";
            dayChange = "";
          });
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$mfName",
              style: TextStyles.textStyle_18_500.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              overflow: TextOverflow.visible,
            ),
            SizedBox(height: 8),
            Text("$category", style: TextStyle(fontSize: 14, color: Colors.white70), overflow: TextOverflow.visible),
            SizedBox(height: 10),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Nav ',
                    style: TextStyles.textStyle_11_400,
                    children: [
                      TextSpan(text: ' ₹$latestNav', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                    ],
                  ),
                ),
                Container(height: 20, width: 1, color: Theme.of(context).colorScheme.onSecondary, margin: EdgeInsets.symmetric(horizontal: 10)),
                RichText(
                  text: TextSpan(
                    text: '1D ',
                    style: TextStyles.textStyle_11_400,
                    children: [
                      TextSpan(text: ' + ₹$dayChange', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
          ],
        );
      },
    );
  }
}

class InvestmentSummary extends StatelessWidget {
  const InvestmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item("Invested", "₹1.5k", context),
          Container(
            height: 30,
            width: 1,
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          _item("Current Value", "₹1.28k", context),
          Container(
            height: 30,
            width: 1,
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          _item("Total Gain", "₹-220.16", context, isLoss: true),
        ],
      ),
    );
  }

  static Widget _item(String label, String value, BuildContext context, {bool isLoss = false}) {
    return Column(
      children: [
        Text(label, style: TextStyles.textStyle_12_400),
        SizedBox(height: 8),
        Text(value, style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      ],
    );
  }
}

class LineChartSection extends StatelessWidget {
  const LineChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * .6,
      child: Center(
        child: BlocBuilder<ChartsCubit, ChartsState>(
          builder: (context, state) {
            if (state is ChartsLoading || state is ChartsInitial) {
              return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
            } else if (state is MutualFundLoaded) {
              final data = state.navData;
              return LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < data.length) {
                            final date = DateFormat('dd-MM-yyyy').parse(data[index].date);
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("${date.month}/${date.year}", style: TextStyle(color: Colors.white, fontSize: 10)),
                            );
                          }
                          return const SizedBox();
                        },
                        interval: max(data.length ~/ 3, 1).toDouble(),
                      ),
                    ),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(data.length, (i) => FlSpot(i.toDouble(), double.parse(data[i].nav))),
                      isCurved: true,
                      color: Theme.of(context).primaryColor,
                      dotData: FlDotData(show: false),
                      barWidth: 1,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [Theme.of(context).colorScheme.onSecondary.withAlpha(50), Theme.of(context).colorScheme.onSecondary.withAlpha(20)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],

                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      tooltipPadding: const EdgeInsets.all(8),
                      tooltipMargin: 16,
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((spot) {
                          return LineTooltipItem(
                            '${data[spot.x.toInt()].date} \nNAV: ₹${spot.y.toStringAsFixed(2)}',
                            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: Text('Error loading chart', style: TextStyle(color: Colors.white)));
            }
          },
        ),
      ),
    );
  }
}

class DurationSelector extends StatelessWidget {
  const DurationSelector({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> durations = ['1M', '3M', '6M', '1Y', '3Y', 'MAX'];
    return BlocBuilder<ChartsCubit, ChartsState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.onSecondary.withAlpha(150)),
          ),
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                durations.map((e) {
                  return GestureDetector(
                    onTap: () => context.read<ChartsCubit>().updateFilter(e),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      decoration: BoxDecoration(
                        color: context.read<ChartsCubit>().currentFilter != e ? Colors.transparent : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        e,
                        style: TextStyles.textStyle_12_400.copyWith(
                          color: context.read<ChartsCubit>().currentFilter != e ? null : Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}

class InvestmentSimulator extends StatefulWidget {
  const InvestmentSimulator({super.key});

  @override
  State<InvestmentSimulator> createState() => _InvestmentSimulatorState();
}

class _InvestmentSimulatorState extends State<InvestmentSimulator> {
  String currentFilter = '1-Time';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("If you invested", style: TextStyles.textStyle_16_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.black),
                    child: Text("₹1 L", style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).colorScheme.onSecondary.withAlpha(150)),
                ),
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:
                          () => setState(() {
                            currentFilter = '1-Time';
                          }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: currentFilter != '1-Time' ? Colors.transparent : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "1-Time",
                          style: TextStyles.textStyle_12_400.copyWith(
                            color: currentFilter != '1-Time' ? null : Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => setState(() {
                            currentFilter = 'Monthly SIP';
                          }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: currentFilter != 'Monthly SIP' ? Colors.transparent : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Monthly SIP",
                          style: TextStyles.textStyle_12_400.copyWith(
                            color: currentFilter != 'Monthly SIP' ? null : Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 2,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(value: 1, onChanged: (_) {}, min: 1, max: 10, activeColor: Colors.blue, inactiveColor: Colors.grey),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("₹ 1 L", style: TextStyle(color: Colors.white)), Text("₹ 10 L", style: TextStyle(color: Colors.white))],
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("This Fund’s past returns", style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                  const SizedBox(height: 8),
                  Text("Profit % (Absolute Return)", style: TextStyles.textStyle_11_400),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("₹ 3.6 L", style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.primary)),
                  SizedBox(height: 8),
                  Text("355.3%", style: TextStyles.textStyle_11_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    axisNameSize: 50,
                    sideTitles: SideTitles(
                      reservedSize: 50,
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        switch (value.toInt()) {
                          case 0:
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Saving A/C', style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                            );
                          case 1:
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Category Avg.',
                                style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                              ),
                            );
                          case 2:
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Direct Plan', style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                            );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [makeGroupData(0, 1.19), makeGroupData(1, 3.63), makeGroupData(2, 4.55)],
                gridData: FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: MediaQuery.sizeOf(context).width * .1,
          borderRadius: BorderRadius.circular(0),
          rodStackItems: [
            BarChartRodStackItem(0, y * 0.2, Theme.of(context).colorScheme.onSecondary),
            BarChartRodStackItem(y * 0.2, y, Theme.of(context).colorScheme.primary),
          ],
        ),
      ],
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextIconButton(callback: () {}, title: 'Sell ', materialIcon: Icon(Icons.arrow_downward))),
        const SizedBox(width: 12),
        Expanded(child: CustomTextIconButton(callback: () {}, title: 'Invest More ', materialIcon: Icon(Icons.arrow_upward))),
      ],
    );
  }
}
