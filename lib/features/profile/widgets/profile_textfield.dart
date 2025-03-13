import 'package:bookworm/core/resources/pallet.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String displayText;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  const ProfileTextField(
      {super.key,
      required this.displayText,
      required this.hintText,
      required this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: const Offset(1, 3))
          ]),
      child: TextField(
        controller: controller..text = displayText,
        keyboardType: textInputType,
        cursorColor: Pallet.primary,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
            counterStyle: const TextStyle(fontSize: 12, color: Colors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey, width: 0.4)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey, width: 0.4),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey))),
      ),
    );
  }
}
