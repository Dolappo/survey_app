import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/screen/welcome/persona_welcome_view_model.dart';
import 'package:survey_challenge/utils/constants.dart';
import 'package:survey_challenge/widgets/perona_button.dart';
import '../../app/app_setup.locator.dart';
import '../../app/app_setup.router.dart';
import 'package:gap/gap.dart';
import '../../utils/text_styles.dart';

class PersonaWelcomeScreen extends StatelessWidget {
  const PersonaWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonaWelcomeViewModel>.reactive(
        viewModelBuilder: () => PersonaWelcomeViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        DefaultTextStyle(
                            style: titleStyle.copyWith(
                                color: Colors.white, fontSize: 28),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText('You\'re Welcome'),
                                WavyAnimatedText('to'),
                                WavyAnimatedText('Personavey'),
                              ],
                              totalRepeatCount: 3,
                              stopPauseOnTap: true,
                            )),
                        // Text('You\'re Welcome', style: titleStyle.copyWith(color: Colors.white, fontSize: 28), textAlign: TextAlign.center,),
                        Text(
                          'Let\'s tell you more about yourself. \nSurprised? Find out here...',
                          style: titleStyle.copyWith(
                              color: Colors.white54, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Gap(70),
                    PersonaButton(
                      buttonTitle: 'Create an Account',
                      onPressed: () => model.createAccount(),
                      buttonColor: Colors.white,
                    ),
                    const Gap(20),
                    PersonaButton(
                      buttonTitle: 'Login',
                      onPressed: () => model.login(),
                      buttonColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
