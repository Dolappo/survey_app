import '../enums/gender.dart';

class PersonaUser{
  String? email;
  String? displayName;
  String? phoneNumber;
  String? gender;
  String? uid;
  PersonaUser({this.email, this.displayName, this.phoneNumber, this.uid, this.gender});

  factory PersonaUser.fromJson(Map<String, dynamic> json)=> PersonaUser(
    displayName: json['displayName'],
    email: json['email'],
    phoneNumber: json['phoneNumber'],
    uid: json['uid']
  );

  Map<String, dynamic> toJson()=>{
    'displayName': displayName,
    'email': email,
    'phoneNumber': phoneNumber,
    'gender': gender,
  };
}