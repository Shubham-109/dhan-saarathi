// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import '../../core/theme/index.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? callback;
  final String? title;
  final double? width;
  final double? radius;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? disabled;
  final Icon? materialIcon;
  final String? icon;
  const CustomTextButton({
    super.key,
    this.width,
    this.color,
    this.height,
    this.radius,
    this.textColor,
    this.icon,
    this.disabled,
    this.borderColor,
    this.materialIcon,
    @required this.callback,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          disabled != null
              ? disabled!
                  ? null
                  : callback
              : callback,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(50, height ?? 45),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        overlayColor: Colors.transparent,
      ),
      child: Text(
        title ?? '',
        textAlign: TextAlign.center,
        style: TextStyles.textStyle_15_500.copyWith(color: textColor ?? Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
