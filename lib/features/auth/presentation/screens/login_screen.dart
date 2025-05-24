import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/logic/cubit/auth/auth_cubit.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> login() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      final user = userCredential.user;
      if (user != null) {
        // Check if user profile exists in Firestore, create if not
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (!doc.exists) {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'email': user.email,
            'displayName': user.email!.split('@')[0],
            'photoURL': '',
            'createdAt': DateTime.now().toIso8601String(),
          });
        }
        log("User logged in: ${user.email}");
        context.read<AuthCubit>().checkAuth();
        Navigator.pop(context);
      }
    } catch (e) {
      log("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 54),
            const Text("Log in to TikTok", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Manage your account, check notifications, comment videos, and more.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "Enter your email",
              ),
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
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                onPressed: () {
                  // Implement forgot password
                },
                child: const Text("Forgot Password?"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.pink,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Show register sheet (implement separately)
              },
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}