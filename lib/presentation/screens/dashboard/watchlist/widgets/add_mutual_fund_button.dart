import 'package:flutter/material.dart';

import '../../../../../core/index.dart';

class AddMutualFundsButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddMutualFundsButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(9)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text("Add Mutual Funds", style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
          ],
        ),
      ),
    );
  }
}
