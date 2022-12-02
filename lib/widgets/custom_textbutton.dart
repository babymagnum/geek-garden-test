import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    this.text,
    this.textWidget,
    this.buttonColor,
    this.shape,
    this.minimumSize,
    this.textColor = Colors.white,
    this.borderColor,
    this.isUseUnderline = false,
    this.padding,
    this.fontSize = 16
  }) : super(key: key);
  final void Function()? onPressed;
  final String? text;
  final Widget? textWidget;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final RoundedRectangleBorder? shape;
  final double? minimumSize;
  final bool isUseUnderline;
  final EdgeInsets? padding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: textWidget ??
            Text(
              text ?? '',
              style: TextStyle(fontSize: Get.width * 0.04, color: textColor),
              maxLines: 1, overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
      ),
      style: TextButton.styleFrom(
        padding: padding,
        shape: shape,
        side: BorderSide(
          color: borderColor ?? (onPressed != null ? Theme.of(context).primaryColor : Colors.black26),
        ),
        backgroundColor:
            buttonColor ?? (onPressed != null ? Theme.of(context).primaryColor : Colors.black26),
        // minimumSize: Size(double.infinity, minimumSize ?? 50),
      ),
    );
  }
}
