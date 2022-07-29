import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:survey_challenge/app/app_setup.router.dart';

import '../../app/app_setup.locator.dart';

class LoginViewModel extends BaseViewModel{
  final _navigate = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = false;

  void textVisibility(){
    obscureText = !obscureText;
    notifyListeners();
  }

  void login(){
    _navigate.clearStackAndShow(Routes.catScreen);
  }


}