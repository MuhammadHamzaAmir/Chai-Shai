import "package:flutter/material.dart";
import 'package:chai_shai/models/chai.dart';

class ChaiTile extends StatelessWidget {
  final Chai? chai;
  const ChaiTile({Key? key, required this.chai}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[chai?.strength ?? 500],
            ),
            title: Text(chai?.name.toString() ?? ''),
            subtitle: Text("Takes ${chai?.sugars} sugar(s)"),
          ),
        )
    );
  }
}
