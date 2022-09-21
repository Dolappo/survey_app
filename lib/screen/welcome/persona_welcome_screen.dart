import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personavey/utils/images.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:personavey/app_controller.dart';
import 'package:personavey/screen/welcome/persona_welcome_view_model.dart';
import 'package:personavey/utils/constants.dart';
import 'package:personavey/widgets/perona_button.dart';
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
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.bgImage),
                  fit: BoxFit.cover,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: Text('Bring out the best of you', style: bodyStyle.copyWith(fontSize: 24, color: Colors.white),),
                    ),
                    PersonaButton(
                      buttonTitle: 'Get Started',
                      onPressed: () => model.createAccount(),
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
