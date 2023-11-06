import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait ||
        ResponsiveBreakpoints.of(context).isTablet) {
      return Padding(
        padding: const EdgeInsets.all(50),
        child: Image.asset("assets/logo_solvro.png"),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Image.asset("assets/logo_solvro.png")),
        ),
      ],
    );
  }
}
