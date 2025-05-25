import 'package:flutter/material.dart';

import '../../core/index.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool? isEnabled;
  final double? radius;

  const CustomDropdown({super.key, required this.items, this.hintText, this.value, this.onChanged, this.validator, this.isEnabled, this.radius});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: isEnabled ?? true ? onChanged : null,
      validator: validator,
      items: List<DropdownMenuItem<T>>.generate(
        items.length,
        (index) =>
            DropdownMenuItem<T>(value: items[index].value, child: Container(padding: const EdgeInsets.only(left: 20), child: items[index].child)),
      ),
      borderRadius: BorderRadius.circular(radius ?? 10),
      style: TextStyles.textStyle_16_400,
      icon: Icon(Icons.arrow_drop_down, color: CustomColors.doveGrayColor),
      dropdownColor: CustomColors.doveGrayColor,
      isExpanded: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
        errorStyle: TextStyles.textStyle_14_400.copyWith(color: CustomColors.doveGrayColor),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(color: CustomColors.doveGrayColor, width: .5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(color: CustomColors.doveGrayColor, width: .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(color: CustomColors.doveGrayColor, width: .5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(color: CustomColors.doveGrayColor, width: .5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(color: CustomColors.doveGrayColor, width: .5),
        ),
        hintText: hintText,
        hintStyle: TextStyles.textStyle_16_400,
      ),
    );
  }
}
