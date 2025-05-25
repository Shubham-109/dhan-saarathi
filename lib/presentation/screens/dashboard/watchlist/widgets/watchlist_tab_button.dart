import 'package:flutter/material.dart';

import '../../../../../core/index.dart';

class WatchlistTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const WatchlistTabButton({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: isSelected ? Colors.transparent : Colors.white24),
        ),
        child: Text(label, style: TextStyles.textStyle_11_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      ),
    );
  }
}
