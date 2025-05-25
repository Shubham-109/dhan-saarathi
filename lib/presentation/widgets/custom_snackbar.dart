import 'package:flutter/material.dart';
import '../../core/index.dart';

class CustomSnackbar {
  static void showSnackbar(BuildContext context, String message, {bool isError = false}) {
    final Color backgroundColor = isError ? Colors.red : Colors.green;
    final Icon icon = isError
        ? const Icon(Icons.error_outline, color: Colors.white)
        : const Icon(Icons.check_circle_outline, color: Colors.white);
    final snackBar = SnackBar(
      content: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyles.textStyle_14_500,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
