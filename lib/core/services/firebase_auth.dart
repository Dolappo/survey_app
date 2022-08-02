import 'package:firebase_auth/firebase_auth.dart';
import 'package:personavey/core/services/firestore_save.dart';

import '../../app/app_setup.locator.dart';
import '../models/user_model.dart';
class PersonaFirebaseAuth{
  final _store = locator<PersonaStore>();
  User? user;

  final _auth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password})async{
  var response = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
  user = response.user;
  print(response.additionalUserInfo?.profile);
  }



  Future<void> signIn({required String email, required String password}) async{
    var response = await _auth.signInWithEmailAndPassword(email: email, password: password);
    user = response.user;
  }

  String? get email => user!.email;
  String? get phone => user!.phoneNumber;
  String? get name => user!.displayName;
  String? get uid => user!.uid;
  String? get imgUrl => user!.photoURL;

}