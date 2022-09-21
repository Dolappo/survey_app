import 'package:flutter/material.dart';
import 'package:personavey/utils/colors.dart';
import 'package:personavey/utils/text_styles.dart';

class PersonaButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isIcon;
  final IconData? buttonIcon;
  final String buttonTitle;
  final Color? buttonColor;
  final Color? textColor;
  const PersonaButton(
      {this.textColor = Colors.white,
      this.buttonColor = AppColor.bgColor,
      this.isIcon = false,
      required this.buttonTitle,
      this.buttonIcon,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 72,
      elevation: 0,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isIcon) Icon(buttonIcon),
          Text(
            buttonTitle,
            style: bodyStyle.copyWith(
                color: textColor, fontWeight: FontWeight.w700, fontSize: 18.69),
          ),
        ],
      ),
    );
  }
}
