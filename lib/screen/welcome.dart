import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/app/app_setup.router.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/utils/text_styles.dart';

import 'category/category_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppController>.reactive(
      viewModelBuilder: ()=> AppController(),
      builder: (context, model, _) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('images/illustration.png'),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Are you ready for this survey?',
                  style: titleStyle.copyWith(fontSize: 18, color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Alert(
                                  context: context,
                                  title: "We are sorry to see you go",
                                  desc: "Kindly exit the app!")
                              .show();
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                            fontSize: 19.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => model.navigate(Routes.catScreen),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                            fontSize: 19.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
