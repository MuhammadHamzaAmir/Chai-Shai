import 'package:chai_shai/services/auth.dart';
import "package:flutter/material.dart";
import 'package:chai_shai/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:chai_shai/screens/home/chai_list.dart';
import 'package:chai_shai/models/chai.dart';
import 'package:chai_shai/screens/home/settings_form.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Chai>?>(
      initialData: null,
      create: (context) => DatabaseService(uid: '').chai,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text("Chai Shai"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.person),
              label: const Text("Logout"),
            ),
            TextButton.icon(
                icon: const Icon(Icons.settings),
                label: const Text("Settings"),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: const ChaiList(),
      ),
    );
  }
}
