import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:personavey/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:personavey/screen/create_account/create_accound_view_model.dart';
import 'package:personavey/widgets/perona_button.dart';
import 'package:personavey/widgets/persona_textfield.dart';
import '../../utils/text_styles.dart';

class CreateAccScreen extends StatelessWidget {
  const CreateAccScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccViewModel>.reactive(
        viewModelBuilder: () => CreateAccViewModel(),
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Form(
                    // key: model.formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Gap(25),
                        Text(
                          'Create a new account',
                          style:
                              titleStyle.copyWith(fontWeight: FontWeight.w700),
                        ),
                        PersonaTextField(
                          controller: model.fullNameController,
                          keyboardType: TextInputType.name,
                          hintText: 'Full name',
                          hintStyle: bodyStyle,
                          inputStyle: bodyStyle,
                          // validator: (value)=> model.validateName(value),
                        ),
                        PersonaTextField(
                          controller: model.emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          hintStyle: bodyStyle,
                          inputStyle: bodyStyle,
                          validator: (value) => model.validateEmail(value),
                        ),
                        PersonaTextField(
                          controller: model.phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone number',
                          hintStyle: bodyStyle,
                          inputStyle: bodyStyle,
                          // validator: (value)=> model.phoneNumberValidator(value),
                        ),
                        PersonaTextField(
                          controller: model.firstPassWordController,
                          hintText: 'Password',
                          obscureText: model.obscureText,
                          hintStyle: bodyStyle,
                          inputStyle: bodyStyle,
                          // validator: (value)=> model.validatePassword(value),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: IconButton(
                                icon: Icon(!model.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () => model.textVisibility()),
                          ),
                        ),
                        PersonaTextField(
                          controller: model.secPassWordController,
                          hintText: 'Confirm password',
                          obscureText: model.obscureText,
                          hintStyle: bodyStyle,
                          inputStyle: bodyStyle,
                          textInputAction: TextInputAction.done,
                          // validator: (value)=> model.validatePassword(value),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: IconButton(
                                icon: Icon(
                                  !model.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () => model.textVisibility()),
                          ),
                        ),
                        const Gap(63),
                        PersonaButton(
                            buttonTitle: 'Sign Up',
                            onPressed: () => model.createAccount()),
                        const Gap(40),
                        Row(
                          children: [
                            Text('Have an account already?',
                                style: bodyStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.24)),
                            TextButton(
                                onPressed: () => model.login(),
                                child: Text(
                                  'Sign In',
                                  style: bodyStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.24,
                                      color: AppColor.bgColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
