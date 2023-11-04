import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/projects_repository.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/standard_text_form_field.dart';

class NewProjectDialog extends ConsumerStatefulWidget {
  const NewProjectDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewProjectDialogState();
}

class _NewProjectDialogState extends ConsumerState<NewProjectDialog> {
  String _name = "";

  String? error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text("New project"),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
                "Let's create new project. You will be able to add users to it later."),
          ),
          StandardTextFormField(
            hintText: "Your super new project",
            labelText: "Project name",
            onChanged: (val) => _name = val,
            errorText: error,
          ),
          const SizedBox(height: 40),
        ],
      ),
      actions: [
        PrimaryButton(
          onPressed: () async {
            if (_name == "") {
              setState(() {
                error = "Project name can't be empty";
              });
            } else {
              await ref.read(projectsRepositoryProvider).addProject(_name);
              Navigator.of(context).pop(_name);
            }
          },
          text: "Create project",
        )
      ],
    );
  }
}
