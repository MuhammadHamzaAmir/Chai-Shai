import 'package:chai_shai/models/logged_in_user.dart';
import 'package:chai_shai/services/database_service.dart';
import 'package:chai_shai/shared/constants.dart';
import 'package:chai_shai/shared/loading.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  late String _currentName = "";
  late String _currentSugars = "0";
  int _currentStrength = 100 ;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<LoggedInUser?>(context);

    return StreamBuilder<LoggedInUserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {

          LoggedInUserData userData = snapshot.data!;

          return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text(
                    "Update your Chai Shai settings",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                    validator: (val) =>
                    val!.isEmpty ? "Please enter a name" : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: userData.sugars.isNotEmpty ? userData.sugars : _currentSugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugars"),
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => _currentSugars = val.toString()),
                  ),
                  Slider(
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    activeColor: Colors.brown[_currentStrength ?? userData.strength],
                    inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400],
                    ),
                    child: const Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        final resp = await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugars ?? userData.sugars,
                            _currentName ?? userData.name,
                            _currentStrength ?? userData.strength
                        );
                        if (resp) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                  ),
                ],
              )
          );
        } else {
          return const Loading();
        }
      }
    );
  }
}
