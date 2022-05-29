import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';
import 'package:movie_app/screens/home/components/_genre_label.dart';

class CommercialMovieCard extends StatelessWidget {
  const CommercialMovieCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.genres,
      required this.premierTag,
      required this.onPress})
      : super(key: key);

  final String image;
  final String title;
  final String description;
  final List<Map<String, dynamic>> genres;
  final String premierTag;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.18,
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding * 0.5),
          color: cardColor),
      padding: const EdgeInsets.only(right: 12, top: 6, bottom: 6),
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          top: -defaultPadding * 0.75,
          left: defaultPadding / 2,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              width: size.width * 0.3,
              height: size.height * 0.18,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: size.width * 0.5,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(
                          style: GoogleFonts.poppins(
                                fontSize: 16, color: backgroundColor),
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DefaultTextStyle(
                          style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: backgroundColor.withOpacity(0.6)),
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: genres.map((item) => GenreLabel(genre: item["genre"])).toList(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultTextStyle(
                                style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: colorRedButton.withOpacity(.6)),
                                child: Text(
                                  premierTag,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding / 2,
                                    vertical: defaultPadding * 0.4),
                                decoration: BoxDecoration(
                                    color: colorRedButton,
                                    borderRadius:
                                        BorderRadius.circular(defaultPadding * 2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: colorRedButton.withOpacity(0.4),
                                          spreadRadius: 4,
                                          blurRadius: 15,
                                          offset: const Offset(0, 2))
                                    ]),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: onPress(),
                                    child: DefaultTextStyle(
                                      style: GoogleFonts.poppins(
                                            fontSize: 13, color: backgroundColor),
                                      child: const Text(
                                        'Book',
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
