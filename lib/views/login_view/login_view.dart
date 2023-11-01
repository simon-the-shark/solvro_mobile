import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/double_color_text_button.dart';
import '../../widgets/name_header.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/standard_text_form_field.dart';
import 'login_view_controller.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginViewControllerProvider.notifier);
    final state = ref.watch(loginViewControllerProvider);
    final errorMap = controller.formatExceptionMap();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Image.asset("assets/logo_solvro.png"),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: const NameHeader(),
                  ),
                  const SizedBox(height: 40),
                  if (state.isLoading)
                    const Center(
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 70),
                            child: CircularProgressIndicator())),
                  if (!state.isLoading) ...[
                    StandardTextFormField(
                      hintText: 'user@email.com',
                      labelText: 'Email',
                      onChanged: controller.emailOnChanged,
                      errorText: errorMap["email"] ??
                          (errorMap["error"] == null ? null : ""),
                    ),
                    const SizedBox(height: 4),
                    StandardTextFormField(
                      labelText: 'Password',
                      hintText: 'Login password',
                      obscureText: true,
                      onChanged: controller.passwordOnChanged,
                      errorText: errorMap["password"] ?? errorMap["error"],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: PrimaryButton(
                        text: 'Login',
                        onPressed: controller.login,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DoubleColorTextButton(
                        textBlack: "New user? ",
                        textBlue: "Register instead.",
                        onPressed: () => context.go("/signup"),
                      ),
                    ),
                  ],
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
