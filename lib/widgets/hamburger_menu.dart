import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.menu_sharp,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
