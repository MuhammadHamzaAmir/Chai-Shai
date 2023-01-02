import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
      body: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
          duration: Duration(milliseconds: 2000),
        ),
      ),
    );
  }
}