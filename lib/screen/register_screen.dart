import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/utils/constants.dart';
import '../app/app_setup.locator.dart';
import '../app/app_setup.router.dart';
import '../utils/text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppController>.reactive(
        viewModelBuilder: () => AppController(),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SafeArea(
              child: Center(
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(50),
                  shadowColor: Colors.white10,
                  elevation: 5,
                  color: const Color(0x0fffffff),
                  child: Container(
                    color: Colors.transparent,
                    height: 400,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Kindly Sign Up!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Please fill in your details below to register',
                            style: titleStyle.copyWith(
                                fontSize: 18, color: Colors.black54),
                          ),
                          const TextField(
                            decoration: kTextFieldStyle,
                            cursorColor: Colors.black38,
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          TextField(
                            decoration: kTextFieldStyle.copyWith(
                                hintText: 'Enter your name'),
                            cursorColor: Colors.black38,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          ElevatedButton(
                            onPressed: () => locator<NavigationService>()
                                .navigateTo(Routes.welcomeScreen),
                            child: Container(
                              width: 80,
                              height: 30,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                      fontSize: 19.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
