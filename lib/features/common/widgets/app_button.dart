import 'package:bookworm/core/resources/pallet.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Size? buttonSize;
  final Icon? buttonIcon;
  final double? fontSize;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? fontColor;
  const AppButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.buttonSize,
      this.buttonIcon,
      this.fontSize,
      this.borderRadius,
      this.backgroundColor,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          fixedSize: buttonSize ?? Size(double.maxFinite, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15)),
          backgroundColor: backgroundColor ?? Pallet.primary),
      child: buttonIcon == null
          ? Text(
              text,
              style: TextStyle(
                  color: fontColor ?? Colors.white, fontSize: fontSize ?? 14),
            )
          : Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonIcon ?? const SizedBox(),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: fontSize ?? 14,
                      color: fontColor ?? Colors.white),
                )
              ],
            ),
    );
  }
}
