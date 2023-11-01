import 'package:flutter/material.dart';

import '../models/enums.dart';

class DropdownFormField extends StatelessWidget {
  const DropdownFormField(
      {super.key,
      this.inputHeight = 60.0,
      this.inputPadding =
          const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      this.radius = const Radius.circular(10),
      this.hintText,
      this.labelText,
      this.obscureText = false,
      required this.items});

  final double inputHeight;
  final EdgeInsets inputPadding;
  final Radius radius;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final List<Enum> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: inputHeight,
      padding: inputPadding,
      child: DropdownButtonFormField(
        padding: EdgeInsets.zero,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              radius,
            ),
          ),
          hintText: hintText,
          labelText: labelText,
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
        onChanged: (e) {},
      ),
    );
  }
}
