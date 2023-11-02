import 'package:flutter/material.dart';

class UsersDropdownFormField<User> extends StatelessWidget {
  const UsersDropdownFormField({
    super.key,
    this.inputHeight = 60.0,
    this.inputPadding = const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
    this.radius = const Radius.circular(10),
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    required this.itemsUsers,
    this.errorText,
  });
  final String? errorText;
  final void Function(User?)? onChanged;
  final double inputHeight;
  final EdgeInsets inputPadding;
  final Radius radius;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final List<User> itemsUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: errorText == null ? inputHeight : inputHeight + 25,
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
          errorText: errorText,
        ),
        itemHeight: inputHeight,
        items: itemsUsers
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      e.toString(),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}