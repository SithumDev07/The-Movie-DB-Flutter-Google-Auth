import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required this.icon, required this.title}) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2, vertical: defaultPadding * 0.4),
            primary: shadedBackgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23))),
        child: Row(
          children: [
            Icon(
              icon,
              color: shadedTextColor,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 16, color: shadedTextColor),
            )
          ],
        ));
  }
}
