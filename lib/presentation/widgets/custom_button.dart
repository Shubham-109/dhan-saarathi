// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../core/index.dart';
import '../../core/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? callback;
  final String title;
  final double? width;
  final double? radius;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? disabled;
  final Icon? materialIcon;
  final String? icon;
  const CustomButton({
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
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed:
          disabled != null
              ? disabled!
                  ? null
                  : callback
              : callback,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(50, height ?? 55),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: color ?? CustomColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          side: BorderSide(color: disabled ?? false ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).primaryColor),
        ),
        alignment: Alignment.centerLeft,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        overlayColor: Colors.transparent,
        disabledBackgroundColor: CustomColors.doveGrayColor.withAlpha(100),
      ),
      child: Container(
        width: width,
        // height: widget.height ?? 55,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            materialIcon != null
                ? Padding(padding: const EdgeInsets.only(right: 10), child: materialIcon ?? const SizedBox())
                : icon != null
                ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SvgPicture.asset(icon ?? '', color: CustomColors.whiteColor, width: 18, height: 18),
                )
                : const SizedBox(),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.textStyle_14_400.copyWith(color: textColor ?? CustomColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
