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

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back_outlined,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
