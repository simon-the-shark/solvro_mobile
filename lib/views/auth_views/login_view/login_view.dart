import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/loader_widget_wrapper.dart';
import '../../../widgets/name_header.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/standard_text_form_field.dart';
import '../widgets/auth_layout.dart';
import '../widgets/double_color_text_button.dart';
import '../widgets/logo.dart';
import 'login_view_controller.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginViewControllerProvider.notifier);
    final state = ref.watch(loginViewControllerProvider);
    final errorMap = controller.formatExceptionMap();
    final scaffold = AuthLayout(
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Logo(),
            Transform.translate(
              offset: const Offset(0, -10),
              child: const NameHeader(),
            ),
            const SizedBox(height: 40),
            if (state.isLoading) const SizedBox(height: 170),
            if (!state.isLoading) ...[
              StandardTextFormField(
                keyboardType: TextInputType.emailAddress,
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: PrimaryButton(
                  text: 'Login',
                  onPressed: controller.login,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
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
    );
    if (state.isLoading) return LoaderWidgetWrapper(child: scaffold);
    return scaffold;
  }
}
