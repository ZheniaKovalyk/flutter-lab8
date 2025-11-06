import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/Google-flutter-logo.png',
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Reset password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Email:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              TextFormField(
                validator: (name) =>
                name == null || name.length < 3
                    ? 'Name should be at least 3 characters'
                    : null,
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "enter email",
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[700],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return const AlertDialog(
                                  title: Text('Message'),
                                  content: Text("Password reset successful"),
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Reset"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.lightBlue[700],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Back"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}