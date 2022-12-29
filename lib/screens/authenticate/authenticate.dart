import 'package:chai_shai/screens/authenticate/register.dart';
import 'package:chai_shai/screens/authenticate/signIn.dart';
import "package:flutter/material.dart";


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return const Register();
  }
}
