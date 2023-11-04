import 'package:flutter/material.dart';

import '../../../../models/enums/enums.dart';

class EstimationMedal extends StatefulWidget {
  const EstimationMedal({
    super.key,
    required this.estimation,
  });

  final EstimationChoices? estimation;

  @override
  State<EstimationMedal> createState() => _EstimationMedalState();
}

class _EstimationMedalState extends State<EstimationMedal> {
  EstimationChoices? previousValue;
  CrossFadeState state = CrossFadeState.showFirst;

  CrossFadeState toogleState() {
    if (widget.estimation != previousValue) {
      previousValue = widget.estimation;
      if (state == CrossFadeState.showFirst) {
        state = CrossFadeState.showSecond;
      } else {
        state = CrossFadeState.showFirst;
      }
    }
    return state;
  }

  @override
  Widget build(BuildContext context) {
    final textValue = EnumJsonConverter.valueString(widget.estimation) ?? "";
    final style = TextStyle(
      fontSize: 15,
      color: Theme.of(context).colorScheme.onSecondary,
    );
    const duration = Duration(milliseconds: 100);

    return Container(
      height: 37,
      width: 37,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: const [0.48, 1],
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer
          ],
        ),
      ),
      child: Center(
        child: AnimatedCrossFade(
          firstChild: Text(
            textValue,
            textAlign: TextAlign.center,
            style: style,
          ),
          secondChild:
              Text(textValue, textAlign: TextAlign.center, style: style),
          duration: duration,
          crossFadeState: toogleState(),
        ),
      ),
    );
  }
}
