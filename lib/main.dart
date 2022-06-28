import 'package:flutter/material.dart';
import 'package:survey_challenge/display_questions_screen.dart';
import 'package:survey_challenge/splash_screen.dart';
import 'package:survey_challenge/register_screen.dart';
import 'package:survey_challenge/welcome.dart';

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
    return MaterialApp(
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
        '/questions': (context) {
          return const DisplayQuestions();
        },
      },
    );
  }
}
