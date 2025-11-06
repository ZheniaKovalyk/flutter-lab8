import 'package:flutter/material.dart';
import './reset_password_screen.dart';
import './signup_screen.dart';

final _formKey = GlobalKey<FormState>();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                      "Sign in",
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
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "enter email",
                ),
                validator: (name) =>
                name == null || name.length < 3
                    ? 'Name should be at least 3 characters'
                    : null,
              ),
              const SizedBox(height: 15),
              const Text(
                "Password:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "enter password",
                ),
                validator: (password) =>
                password == null || password.length < 6
                    ? 'Password should be at least 6 characters'
                    : null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[700],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text("Sign up"),
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
                                  content: Text("Login successful"),
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Login"),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text("Reset password"),
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
