import 'package:flutter/material.dart';

class BlockedDeleteButton extends StatelessWidget {
  const BlockedDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.8),
            ),
          ),
          SizedBox(
            width: 200,
            height: 45,
            child: FilledButton(
              onPressed: null,
              child: FittedBox(
                child: Text(
                  "You can't delete closed task",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
