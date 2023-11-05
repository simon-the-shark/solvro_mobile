import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/secondary_button.dart';
import '../../new_project_dialog.dart';

class NewProjectButton extends ConsumerWidget {
  const NewProjectButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SecondaryButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Theme(
                  data: Theme.of(context), child: const NewProjectDialog());
            },
          );
        },
        text: "Dodaj nowy projekt",
      ),
    );
  }
}
