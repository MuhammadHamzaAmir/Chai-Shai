import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:chai_shai/models/chai.dart';
import 'package:chai_shai/screens/home/chai_tile.dart';


class ChaiList extends StatefulWidget {
  const ChaiList({Key? key}) : super(key: key);

  @override
  State<ChaiList> createState() => _ChaiListState();
}

class _ChaiListState extends State<ChaiList> {



  @override
  Widget build(BuildContext context) {

    final chai = Provider.of<List<Chai>?>(context);


    return ListView.builder(
        itemCount: chai?.length,
        itemBuilder: (context, index) {
          return ChaiTile(chai: chai?.elementAt(index));
        });
  }
}
