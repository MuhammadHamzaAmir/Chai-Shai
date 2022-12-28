import 'package:chai_shai/screens/authenticate/authenticate.dart';
import 'package:chai_shai/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:chai_shai/models/logged_in_user.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    if (Provider.of<LoggedInUser?>(context) == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
