import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.placeHolder,
    required this.isObscured,
    required this.controller,
  }) : super(key: key);

  final String placeHolder;
  final bool isObscured;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: shadedBackgroundColor,
          border: Border.all(
            color: shadedTextColor,
          )),
      child: TextField(
        controller: controller,
        keyboardType: isObscured
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        obscureText: isObscured,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeHolder,
            hintStyle: GoogleFonts.poppins(color: shadedTextColor)),
        style: GoogleFonts.poppins(color: backgroundColor),
      ),
    );
  }
}