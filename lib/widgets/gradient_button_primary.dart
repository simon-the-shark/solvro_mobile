import 'package:flutter/material.dart';

class GradientButtonPrimary extends StatelessWidget {
  const GradientButtonPrimary({this.text, this.onPressed, Key? key})
      : super(key: key);
  final String? text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 200,
        height: 45,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.4, 1],
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            child: Stack(
              children: [
                if (text != null)
                  Center(
                    child: Text(
                      text ?? "",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (text == null)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
