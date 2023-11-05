import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/enums/enums.dart';
import '../../../widgets/enum_dropdown_form_field.dart';
import '../../../widgets/loader_widget_wrapper.dart';
import '../../../widgets/name_header.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/standard_text_form_field.dart';
import '../widgets/double_color_text_button.dart';
import 'signup_view_controller.dart';

class SignupView extends ConsumerWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signupViewControllerProvider.notifier);
    final state = ref.watch(signupViewControllerProvider);
    final errorMap = controller.formatExceptionMap();
    final scaffold = Scaffold(
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
                  if (state.isLoading) const SizedBox(height: 170),
                  if (!state.isLoading) ...[
                    const SizedBox(height: 40),
                    StandardTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'user@email.com',
                      labelText: 'Email',
                      onChanged: controller.emailOnChanged,
                      errorText: errorMap["email"] ??
                          (errorMap["error"] == null ? null : ""),
                    ),
                    StandardTextFormField(
                      labelText: 'Password',
                      hintText: 'Login password',
                      obscureText: true,
                      onChanged: controller.passwordOnChanged,
                      errorText: errorMap["password"] ?? errorMap["error"],
                    ),
                    EnumDropdownFormField<ProfessionChoices>(
                      hintText: "Profession",
                      items: ProfessionChoices.values
                          .where((element) => element != ProfessionChoices.none)
                          .toList(),
                      onChanged: controller.professionOnChanged,
                      errorText: errorMap["profession"],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: PrimaryButton(
                        text: 'Sign Up',
                        onPressed: controller.register,
                      ),
                    ),
                  ],
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
    if (state.isLoading) return LoaderWidgetWrapper(child: scaffold);
    return scaffold;
  }
}
