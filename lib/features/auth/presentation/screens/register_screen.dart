import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok_clone/core/themes/colors.dart';

import '../../../../core/themes/font_weight_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> register() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      log("User registered: ${userCredential.user?.email}");
    } catch (e) {
      log("Error: $e");
    }
  }

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              "Sign Up",
              style: AppFonts.extraBold,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  hintText: "Enter your email"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                labelText: "Password",
                hintText: "Enter your password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?",
                      style: AppFonts.regular.copyWith(
                        color: AppColors.textPrimary,
                      ))),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.pink,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Sign Up", style: AppFonts.button),
            ),
          ],
        ),
      ),
    );
  }
}
