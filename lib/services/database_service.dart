import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chai_shai/models/logged_in_user.dart';
import 'package:chai_shai/models/chai.dart';

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

  Stream<List<Chai>> get chai {
    return chaiCollection.snapshots().map(_chaiListFromSnapshot);
  }

  List<Chai> _chaiListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Chai(
        name: doc.get("name") ?? '',
        sugars: doc.get("sugars") ?? '0',
        strength: doc.get("strength") ?? 0,
      );
    }).toList();
  }

  LoggedInUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return LoggedInUserData(
      uid: uid,
      name: snapshot.get("name"),
      sugars: snapshot.get("sugars"),
      strength: snapshot.get("strength"),
    );
  }

  Stream<LoggedInUserData> get userData {
    return chaiCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}