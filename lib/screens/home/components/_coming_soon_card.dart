import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({Key? key, required this.image, required this.title, required this.issueDate}) : super(key: key);

  final String image;
  final String title;
  final String issueDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          top: defaultPadding,
          left: defaultPadding / 2,
          bottom: defaultPadding),
      width: size.width * 0.4,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                image,
                width: size.width * 0.4,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8
              ),
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: GoogleFonts.poppins(
                      fontSize: defaultPadding * 0.75, color: backgroundColor),
                    child: Text(
                        title,
                      ),
                  ),
              DefaultTextStyle(
                style: GoogleFonts.poppins(
                      fontSize: defaultPadding * 0.6, color: shadedTextColor),
                child: Text(
                  issueDate,
                ),
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
