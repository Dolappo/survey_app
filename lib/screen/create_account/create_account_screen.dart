import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
                onPressed: ()=>Navigator.pop(context),
                 icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor,),
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
                        Gap(25),
                        Text('Create account', style: titleStyle.copyWith(color: Theme.of(context).primaryColor),),
                        Text('Join us today', style: bodyStyle.copyWith(color: Theme.of(context).primaryColor),textAlign: TextAlign.start,),
                        Gap(25),
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
                          validator: (value)=> model.validateEmail(value),
                        ),
                        PersonaTextField(
                          controller: model.phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone',
                          hintStyle: bodyStyle,
                          inputStyle: bodyStyle,
                          // validator: (value)=> model.phoneNumberValidator(value),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Gender:',
                                style: bodyStyle.copyWith(color: Colors.grey),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                   Text('Male', style: bodyStyle.copyWith(color: Colors.grey),),
                                  Radio(
                                    activeColor: Theme.of(context).primaryColor,
                                      splashRadius: 10,
                                      value: model.maleValue,
                                      groupValue: model.gender,
                                      onChanged: (value) =>
                                          model.onChangedValue(value)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                   Text('Female', style: bodyStyle.copyWith(color: Colors.grey),),
                                  Radio(
                                    splashRadius: 10,
                                    activeColor: Theme.of(context).primaryColor,
                                    value: model.femaleValue,
                                    groupValue: model.gender,
                                    onChanged: (value) => model.onChangedValue(value),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        PersonaTextField(
                          controller: model.firstPassWordController,
                          hintText: 'Password',
                          obscureText: model.obscureText,
                          hintStyle: bodyStyle,
                          inputStyle: bodyStyle,
                          // validator: (value)=> model.validatePassword(value),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top:8.0),
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
                            padding: const EdgeInsets.only(top:8.0),
                            child: IconButton(
                                icon: Icon(!model.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility, color: Theme.of(context).primaryColor,),
                                onPressed: () => model.textVisibility()),
                          ),
                        ),
                        const Gap(20),
                        PersonaButton(
                            buttonTitle: 'Create account',
                            textColor: Colors.white,
                            buttonColor: Theme.of(context).primaryColor,
                            onPressed: ()=> model.createAccount())
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
