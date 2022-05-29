import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';

class GenreLabel extends StatelessWidget {
  const GenreLabel({Key? key, required this.genre}) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: shadedBackgroundColor,
        ),
        borderRadius: BorderRadius.circular(7)
      ),
      child: DefaultTextStyle(
        style: GoogleFonts.poppins(
            fontSize: 10,
            color: shadedTextColor
          ),
        child: Text(
          genre,
        ),
      ),
    );
  }
}
