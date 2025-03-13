import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? maxLength;
  final bool? isObscure;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  const CommonTextField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines,
      this.maxLength,
      this.isObscure,
      this.textInputType,
      this.textInputAction,
      this.controller});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Container(
      decoration: BoxDecoration(
          color: Pallet.background, borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: controller,
        obscureText: isObscure ?? false,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        // style: TextStyle(fontSize: 12),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        onSubmitted: (value) => homeController.searchBooks(),
        textInputAction: textInputAction,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
            counterStyle: TextStyle(fontSize: 12, color: Colors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}
