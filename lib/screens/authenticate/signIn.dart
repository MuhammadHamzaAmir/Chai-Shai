
import 'package:chai_shai/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("Sign in to Chai Shai"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
            child: const Text("Sign in"),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print("Error signing in");
              } else {
                print("Signed in");
                print(result.uid);
              }
            },
        ),
      ),
    );
  }
}