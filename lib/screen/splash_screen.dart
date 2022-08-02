import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:personavey/screen/welcome/persona_welcome_screen.dart';

import '../utils/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PersonaWelcomeScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
      child:
          Text('Personavey', style: titleStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }
}
