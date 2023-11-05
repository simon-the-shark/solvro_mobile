import 'package:flutter/material.dart';

import '../../../../models/users/user.dart';

class UsersDropdownFormField extends StatelessWidget {
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
    this.initialUser,
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
  final User? initialUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: inputPadding,
      child: DropdownButtonFormField<User?>(
        padding: EdgeInsets.zero,
        value: initialUser,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
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
        items: [
          const DropdownMenuItem(
            value: null,
            child: Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Text("---"),
            ),
          ),
          ...itemsUsers
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(e.representationName),
                  ),
                ),
              )
              .toList()
        ],
        onChanged: onChanged,
      ),
    );
  }
}
