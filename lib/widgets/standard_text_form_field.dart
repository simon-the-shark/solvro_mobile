import 'package:flutter/material.dart';

class StandardTextFormField extends StatelessWidget {
  const StandardTextFormField(
      {super.key,
      this.inputHeight = 60.0,
      this.inputPadding =
          const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      this.radius = const Radius.circular(10),
      this.hintText,
      this.labelText,
      this.obscureText = false});

  final double inputHeight;
  final EdgeInsets inputPadding;
  final Radius radius;
  final String? hintText;
  final String? labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: inputHeight,
      padding: inputPadding,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              radius,
            ),
          ),
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
