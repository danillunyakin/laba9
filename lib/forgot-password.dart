
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_reset,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Password recovery',
                  style: TextStyle(fontSize: 28),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email or Login',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your email or login';
                    }

                    if (value.contains('@') &&
                        !RegExp(
                          r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                        ).hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text('Message'),
                            content: Text('Validation successful'),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Reset password'),
                ),

                const SizedBox(height: 10),

                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
