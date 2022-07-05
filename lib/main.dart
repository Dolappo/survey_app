import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_challenge/screen/display_questions_screen.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/screen/splash_screen.dart';
import 'package:survey_challenge/screen/register_screen.dart';
import 'package:survey_challenge/screen/welcome.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> AppController(),
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) {
              return const SplashScreen();
            },
            '/register': (context) {
              return const Register();
            },
            '/welcome': (context) {
              return const Welcome();
            },
          }
    ),);
  }
}
