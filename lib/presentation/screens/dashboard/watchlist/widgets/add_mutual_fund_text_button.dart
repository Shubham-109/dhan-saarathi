import 'package:flutter/material.dart';
import '../../../../../core/index.dart';

class AddMutualFundsTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddMutualFundsTextButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Theme.of(context).primaryColor, size: 25),
            SizedBox(width: 8),
            Text("Add", style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }
}
