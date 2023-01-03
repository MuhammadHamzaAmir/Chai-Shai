import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final CollectionReference chaiCollection = FirebaseFirestore.instance.collection('chai');
  late final String uid;

  DatabaseService({required this.uid});

  Future updateUserData(String sugars, String name, int strength) async {

    return await chaiCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

}