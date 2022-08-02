import 'package:flutter/material.dart';
import 'package:personavey/utils/text_styles.dart';

class PersonaButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isIcon;
  final IconData? buttonIcon;
  final String buttonTitle;
  final Color? buttonColor;
  final Color? textColor;
  const PersonaButton({
    this.textColor = Colors.teal,
    this.buttonColor = Colors.white54,
    this.isIcon = false,
    required this.buttonTitle,
    this.buttonIcon,
    this.onPressed,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      elevation: 0,
      color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isIcon)
              Icon(buttonIcon),
            Text(buttonTitle, style: bodyStyle.copyWith(color: textColor),),
          ],
        ),
    );
  }
}
