import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:survey_challenge/app/app_setup.router.dart';

import '../../app/app_setup.locator.dart';

class PersonaWelcomeViewModel extends BaseViewModel{
  final _navigate = locator<NavigationService>();

  void createAccount(){
    _navigate.navigateTo(Routes.createAccScreen);
  }
  void login(){
    _navigate.navigateTo(Routes.loginScreen);
  }

}