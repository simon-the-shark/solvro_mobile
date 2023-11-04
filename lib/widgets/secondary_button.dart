import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.size = const Size(200, 45),
  });

  final void Function() onPressed;
  final String text;
  final Color? color;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            color ?? Theme.of(context).colorScheme.secondary,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}
