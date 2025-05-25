import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? initialText;
  final Function? onChanged;
  final Function? validate;
  final bool? isObsecure;
  final bool? isEnabled;
  final bool? showFloatingLabel;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? prefix;
  final int? maxLength;
  final double? radius;
  final double? letterSpacing;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    super.key,
    this.controller,
    this.isEnabled,
    this.maxLength,
    this.textInputType,
    this.isObsecure,
    this.radius,
    this.maxLines,
    this.initialText,
    this.onChanged,
    this.validate,
    this.prefix,
    this.letterSpacing,
    this.inputFormatters,
    this.showFloatingLabel,
    @required this.hintText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      initialValue: widget.initialText,
      controller: widget.controller,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      onFieldSubmitted: (value) {},
      validator: (value) {
        if (widget.validate != null) return widget.validate!(value);
        return null;
      },
      enabled: widget.isEnabled,
      keyboardType: widget.textInputType,
      maxLength: widget.maxLength,
      style: TextStyles.textStyle_14_400.copyWith(
        decoration: TextDecoration.none,
        color: Theme.of(context).colorScheme.onPrimary,
        letterSpacing: widget.letterSpacing,
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        isDense: true,
        label: Text(
          widget.hintText ?? '',
          style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onSecondary, letterSpacing: widget.letterSpacing),
        ),
        floatingLabelBehavior: widget.showFloatingLabel ?? false ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
        border: const OutlineInputBorder(),
        fillColor: Theme.of(context).cardColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary, width: .5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
          borderSide: BorderSide(color: Theme.of(context).disabledColor, width: .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: .5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: .5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: .5),
        ),
        counterText: '',
        prefixIcon: widget.prefix,
        suffix:
            widget.isObsecure != null
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  iconSize: 15,
                  padding: const EdgeInsets.only(top: 5),
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  icon: Icon(visible ? Icons.visibility : Icons.visibility_off, color: CustomColors.whiteColor),
                )
                : null,
        filled: true,
        labelStyle: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary, letterSpacing: widget.letterSpacing),
        // hintStyle: TextStyles.textStyle_14_400.copyWith(
        //   color: Theme.of(context).colorScheme.onPrimary,
        //   letterSpacing: widget.letterSpacing,
        // ),
        // hintText: widget.hintText,
      ),
      obscureText: widget.isObsecure != null ? !visible : false,
    );
  }
}
