import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/enums.dart';
import '../widgets/double_color_text_button.dart';
import '../widgets/dropdown_form_field.dart';
import '../widgets/name_header.dart';
import '../widgets/primary_button.dart';
import '../widgets/standard_text_form_field.dart';

class SignupView extends ConsumerWidget {
  SignupView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Image.asset(
                      "assets/logo_solvro.png",
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: const NameHeader(),
                  ),
                  const SizedBox(height: 40),
                  const StandardTextFormField(
                    hintText: 'user@email.com',
                    labelText: 'Email',
                  ),
                  const StandardTextFormField(
                    labelText: 'Password',
                    hintText: 'Login password',
                    obscureText: true,
                  ),
                  const DropdownFormField(
                    hintText: "Profession",
                    items: ProfessionChoices.values,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: PrimaryButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DoubleColorTextButton(
                      textBlack: "Already have an account? ",
                      textBlue: "Login instead.",
                      onPressed: () => context.go("/login"),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
