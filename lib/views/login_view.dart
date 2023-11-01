import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const inputPadding = EdgeInsets.symmetric(horizontal: 22, vertical: 4);
    const inputHeight = 60.0;
    const radius = Radius.circular(10);
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
              key: _formKey,
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
                    child: Text(
                      "Solvro Taskmanager",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    height: inputHeight,
                    padding: inputPadding,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Login email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            radius,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: inputHeight,
                    padding: inputPadding,
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            radius,
                          ),
                        ),
                        hintText: 'Login password',
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: SizedBox(
                      width: 150,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                              text: "New user? ",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              children: [
                                TextSpan(
                                  text: "Register instead.",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ]),
                        )),
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
