import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:survey_challenge/screen/register_screen.dart';

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
          builder: (context) => const Register(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Padding(
              padding: EdgeInsets.all(10),
            ),
          ),
          Row(
            children: [
              const Image(
                height: 120,
                width: 120,
                image: AssetImage(
                  'images/ribbonimage.png',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Survey',
                    style: titleStyle.copyWith(fontSize: 42),
                  ),
                  Text(
                    'Help you manage your health',
                    style: titleStyle,
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: SpinKitFadingCircle(
              color: Colors.pinkAccent,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
