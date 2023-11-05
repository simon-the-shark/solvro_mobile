import 'package:flutter/material.dart';

class StandardTextFormField extends StatelessWidget {
  const StandardTextFormField({
    super.key,
    this.inputHeight = 60.0,
    this.inputPadding = const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
    this.radius = const Radius.circular(10),
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.validator,
    this.isReadOnly = false,
    this.initValue,
    this.controller,
    this.keyboardType = TextInputType.name,
  });

  final double inputHeight;
  final EdgeInsets inputPadding;
  final Radius radius;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final void Function(String val)? onChanged;
  final String? errorText;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final String? initValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    const errorExtraHeight = 25.0;
    return Transform.translate(
      offset: errorText == "" ? const Offset(0, errorExtraHeight) : Offset.zero,
      child: Container(
        height:
            errorText == null ? inputHeight : inputHeight + errorExtraHeight,
        padding: inputPadding,
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          initialValue: initValue,
          readOnly: isReadOnly,
          validator: validator,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                radius,
              ),
            ),
            errorText: errorText,
            hintText: hintText,
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}
