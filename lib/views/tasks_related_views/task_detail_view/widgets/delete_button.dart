import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:holding_gesture/holding_gesture.dart';

class DeleteButton extends StatefulWidget {
  const DeleteButton({
    super.key,
    required this.onLoaded,
  });

  final void Function() onLoaded;

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const duration = Duration(seconds: 5);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isHolding = false;

  void _startAnimation() {
    _controller.forward();
    setState(() {
      isHolding = true;
    });
  }

  void _stopAnimation() {
    _controller.reset();
    setState(() {
      isHolding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HoldTimeoutDetector(
      onTimeout: () {
        widget.onLoaded();
        _stopAnimation();
      },
      onTimerInitiated: _startAnimation,
      onCancel: _stopAnimation,
      holdTimeout: duration,
      enableHapticFeedback: true,
      onTap: () {
        Fluttertoast.showToast(
          msg: "Hold for 5s to delete this task",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textColor: Colors.white,
          fontSize: 20.0,
        );
      },
      child: SizedBox(
        width: 200,
        height: 45,
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
            ),
            Container(
              width: 200,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                // color: Colors.red.shade200,
                color: Theme.of(context).colorScheme.errorContainer,
                // color: Theme.of(context).colorScheme.error,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  width: 30 + 180 * _controller.value,
                  duration: const Duration(milliseconds: 200),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 45,
              child: FilledButton(
                onPressed: null,
                child: Text(
                  "Delete task",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
