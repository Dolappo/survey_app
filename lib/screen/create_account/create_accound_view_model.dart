import 'package:flutter/material.dart';
import 'package:personavey/app/app_setup.router.dart';
import 'package:personavey/core/enums/gender.dart';
import 'package:personavey/core/models/user_model.dart';
import 'package:personavey/core/services/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app_setup.locator.dart';
import '../../core/services/firestore_save.dart';

class CreateAccViewModel extends BaseViewModel {
  final _navigate = locator<NavigationService>();
  final _store = locator<PersonaStore>();
  final _auth = locator<PersonaFirebaseAuth>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstPassWordController = TextEditingController();
  TextEditingController secPassWordController = TextEditingController();

  // final formState = GlobalKey<FormState>();

  bool obscureText = false;

  void textVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  String maleValue = getGenderCapitalized(Gender.male);
  String femaleValue = getGenderCapitalized(Gender.female);
  String gender = '';

  onChangedValue(value) {
    gender = value!;
    notifyListeners();
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'This field can\'t be empty';
    } else {
      return null;
    }
  }

  String? validateEmail(String? email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);
    if (!emailValid) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? value) {
    bool numberValid =
        RegExp(r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/').hasMatch(value!);
    if (phoneController.text.isEmpty) {
      return 'Enter valid Phone Number';
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password!);
    if (!passwordValid) {
      return 'hint: not less than 8 characters,  a upper case and a special character';
    } else {
      return null;
    }
  }

  // bool confirmPassword(){
  //   if(firstPassWordController != secPassWordController){
  //     return false;
  //   }
  // }

  Future<void> createAccount() async {
    // formState.currentState!.validate() &&
    if (firstPassWordController == secPassWordController) {
      try {
        setBusy(true);
        await _auth.signUp(
            email: emailController.text,
            password: firstPassWordController.text);

        await _store.saveUserDetails(PersonaUser(
                email: emailController.text,
                phoneNumber: phoneController.text,
                displayName: fullNameController.text,
                gender: gender)
            .toJson());
      } catch (e) {
        print(e);
      }
      setBusy(false);
      _navigate.replaceWith(Routes.catScreen);
    } else {
      return;
    }
  }
}
