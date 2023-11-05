import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/standard_text_form_field.dart';
import '../add_users_view_controller.dart';

class MultiEmailField extends ConsumerStatefulWidget {
  const MultiEmailField({
    super.key,
  });

  @override
  ConsumerState<MultiEmailField> createState() => _MultiEmailFieldState();
}

class _MultiEmailFieldState extends ConsumerState<MultiEmailField> {
  String currentFieldValue = "";
  String? error;
  final TextEditingController _textController = TextEditingController();
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: StandardTextFormField(
            controller: _textController,
            hintText: 'user@email.com',
            labelText: 'Email',
            onChanged: (val) {
              currentFieldValue = val;
            },
            errorText: error,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            IconButton.filled(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
              onPressed: () {
                setState(() {
                  if (currentFieldValue == "") {
                    error = "Email can't be empty";
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(currentFieldValue)) {
                    error = "Invalid email format";
                  } else {
                    error = null;
                  }
                });
                if (error == null) {
                  ref
                      .read(addUsersViewControllerProvider.notifier)
                      .addUserEmail(currentFieldValue);
                  _textController.clear();
                  currentFieldValue = "";
                }
              },
              icon: const Icon(
                Icons.add,
                size: 35,
              ),
            ),
          ],
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
