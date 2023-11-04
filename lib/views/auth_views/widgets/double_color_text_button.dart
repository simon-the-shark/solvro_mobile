import 'package:flutter/material.dart';

class DoubleColorTextButton extends StatelessWidget {
  const DoubleColorTextButton({
    super.key,
    required this.textBlack,
    required this.textBlue,
    this.onPressed,
  });

  final String textBlack;
  final String textBlue;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: RichText(
          text: TextSpan(
              text: textBlack,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              children: [
                TextSpan(
                  text: textBlue,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ]),
        ));
  }
}
