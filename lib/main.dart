import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:survey_challenge/screen/display_questions_screen.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/screen/splash_screen.dart';
import 'package:survey_challenge/screen/welcome/persona_welcome_screen.dart';
import 'package:survey_challenge/screen/welcome.dart';
import 'package:survey_challenge/setups/setup_bottom_sheet_ui.dart';
import 'package:survey_challenge/setups/setup_dialog_ui.dart';
import 'package:survey_challenge/setups/setup_snackbar_ui.dart';

import 'app/app_setup.locator.dart';
import 'app/app_setup.router.dart';

void main(){
  setupLocator();
  setupBottomSheetUi();
  // setupSnackbarUi();
  setupDialogUi();
  runApp(const MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
        backgroundColor: Colors.teal,
        buttonColor: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) {
      //     return const SplashScreen();
      //   },
      //   '/register': (context) {
      //     return const RegisterScreen();
      //   },
      //   '/welcome': (context) {
      //     return const WelcomeScreen();
      //   },
      // }
    );
  }
}
