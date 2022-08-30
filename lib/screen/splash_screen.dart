import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:personavey/screen/welcome/persona_welcome_screen.dart';

import '../utils/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override

  AnimationController? controller;
  Animation? backgroundAnimation;
  Animation? textAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    backgroundAnimation = ColorTween(begin: Colors.white, end: Theme.of(context).primaryColor)
        .animate(controller!);
    textAnimation = ColorTween(begin: Theme.of(context).primaryColor, end: Colors.white).animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 5)).then(
          (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PersonaWelcomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundAnimation!.value,
      body: Center(
      child:
          Text('Personavey',
              style: titleStyle.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: textAnimation!.value)),
      ),
    );
  }
}
