import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/secondary_button.dart';

class NewProjectButton extends ConsumerWidget {
  const NewProjectButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SecondaryButton(
        onPressed: () {},
        text: "Dodaj nowy projekt",
      ),
    );
  }
}
