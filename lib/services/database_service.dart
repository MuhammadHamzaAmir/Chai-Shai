import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final CollectionReference chaiCollection = FirebaseFirestore.instance.collection('chai');

}