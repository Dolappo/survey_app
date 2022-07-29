import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/screen/login/login_view_model.dart';
import 'package:survey_challenge/utils/images.dart';

import '../../utils/text_styles.dart';
import '../../widgets/perona_button.dart';
import '../../widgets/persona_textfield.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: ()=> LoginViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor,),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/lock.png'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PersonaTextField(
                        controller: model.emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email',
                        hintStyle: bodyStyle,
                        inputStyle: bodyStyle,
                      ),
                      PersonaTextField(
                        controller: model.passwordController,
                        hintText: 'Password',
                        obscureText: model.obscureText,
                        hintStyle: bodyStyle,
                        inputStyle: bodyStyle,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: IconButton(
                              icon: Icon(!model.obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () => model.textVisibility()),
                        ),
                      ),
                      const Gap(20),
                      PersonaButton(
                          buttonTitle: 'Login',
                          textColor: Colors.white,
                          buttonColor: Theme.of(context).primaryColor,
                          onPressed: ()=> model.login())
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
