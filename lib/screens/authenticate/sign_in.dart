
import 'package:chai_shai/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";


class SignIn extends StatefulWidget {

  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("Sign in to Chai Shai"),
        actions:<Widget>[
          TextButton.icon(
            onPressed: () async {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text("Register"),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (kDebugMode) {
                    print("email: $email password: $password");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
