import 'package:flutter/material.dart';

import '../models/enums/enums.dart';

class EnumDropdownFormField<T extends Enum> extends StatelessWidget {
  const EnumDropdownFormField({
    super.key,
    this.inputHeight = 60.0,
    this.inputPadding = const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
    this.radius = const Radius.circular(10),
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    required this.items,
    this.errorText,
    this.initialValue,
  });
  final String? errorText;
  final void Function(T?)? onChanged;
  final double inputHeight;
  final EdgeInsets inputPadding;
  final Radius radius;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final List<T> items;
  final T? initialValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: inputPadding,
      child: DropdownButtonFormField(
        value: initialValue,
        padding: EdgeInsets.zero,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              radius,
            ),
          ),
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
        ),
        itemHeight: inputHeight,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      EnumJsonConverter.valueString(e) ?? "",
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
