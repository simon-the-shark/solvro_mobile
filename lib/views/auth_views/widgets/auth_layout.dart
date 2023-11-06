import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: Padding(
                  padding:
                      ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET)
                          ? const EdgeInsets.all(50.0)
                          : EdgeInsets.zero,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
