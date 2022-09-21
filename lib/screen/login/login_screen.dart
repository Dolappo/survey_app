import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:personavey/screen/login/login_view_model.dart';
import 'package:personavey/utils/images.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../../widgets/perona_button.dart';
import '../../widgets/persona_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 62.0),
                        child: Text(
                          'Welcome Back!',
                          style: titleStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PersonaTextField(
                              controller: model.emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: 'Email Address',
                              inputStyle: bodyStyle,
                            ),
                            PersonaTextField(
                              controller: model.passwordController,
                              hintText: 'Password',
                              obscureText: model.obscureText,
                              inputStyle: bodyStyle,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: IconButton(
                                    icon: Icon(!model.obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () => model.textVisibility()),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: bodyStyle.copyWith(
                                        color: Colors.grey.shade300,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                            const Gap(100),
                            PersonaButton(
                                buttonTitle: 'Sign In',
                                onPressed: () => model.login()),
                            const Gap(11),
                            PersonaButton(
                                isIcon: true,
                                buttonIcon: Icons.circle,
                                buttonTitle: 'Sign Up with Google',
                                buttonColor: Colors.white,
                                textColor: Colors.grey,
                                onPressed: () => model.login()),
                            Gap(40),
                            Row(
                              children: [
                                Text('Don\'t have an account',
                                    style: bodyStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.24)),
                                Text('Sign Up',
                                    style: bodyStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.24,
                                        color: AppColor.bgColor)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
