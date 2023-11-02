import 'package:flutter/material.dart';

class LoaderWidgetWrapper extends StatelessWidget {
  const LoaderWidgetWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Stack(
        children: [
          child,
          const Positioned.fill(
            child: ModalBarrier(
              color: Colors.black54,
              dismissible: false,
            ),
          ),
          Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primaryContainer,
          )),
        ],
      ),
    );
  }
}
