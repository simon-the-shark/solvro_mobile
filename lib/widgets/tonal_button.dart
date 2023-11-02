import 'package:flutter/material.dart';

class TonalButton extends StatelessWidget {
  const TonalButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
      ),
    );
  }
}
