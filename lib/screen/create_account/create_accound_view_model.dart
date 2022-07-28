import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreateAccViewModel extends BaseViewModel{
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstPassWordController = TextEditingController();
  TextEditingController secPassWordController = TextEditingController();

  bool obscureText = false;

  void textVisibility(){
    obscureText = !obscureText;
    notifyListeners();
  }

  String maleValue = 'Male';
  String femaleValue = 'Female';
  String groupValue = '';

  onChangedValue(value){
    groupValue = value!;
    notifyListeners();
  }
}