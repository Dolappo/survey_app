import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonaStore{
  final store = FirebaseFirestore.instance;
  late CollectionReference _usersCollection;
  late DocumentReference _userPath;

  CollectionReference get usersCollection => _usersCollection;


  void initialize(){
   _usersCollection = store.collection('Users');
  }

  Future<void> saveUserDetails(Map<String, dynamic> data)async{
    await _usersCollection.doc(data['email']).set(data);
  }






}