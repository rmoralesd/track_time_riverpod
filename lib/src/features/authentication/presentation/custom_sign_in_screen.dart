import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class CustomSignInScreen extends StatelessWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign in"),
        ),
        body: SignInScreen());
  }
}
