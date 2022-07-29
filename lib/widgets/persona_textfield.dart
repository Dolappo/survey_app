import 'package:flutter/material.dart';
import 'package:survey_challenge/utils/text_styles.dart';
class PersonaTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextStyle? inputStyle;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool obscureText;
  final TextInputAction textInputAction;
  const PersonaTextField({
    Key? key,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.validator,
    this.onChanged,
     this.inputStyle,
    required this.controller,
     this.keyboardType,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 3),
          child: TextFormField(
            textInputAction: textInputAction,
            obscureText: obscureText,
            validator: validator,
            style: inputStyle,
            onChanged: onChanged,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffix: suffixIcon,
              hintText: hintText,
              hintStyle: bodyStyle.copyWith(color: Colors.grey, fontSize: 14),
            ),

          ),
        ),
      ),
    );
  }
}
