import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';
import 'package:movie_app/auth/authentication.dart';
import 'package:movie_app/screens/home/components/_coming_soon_card.dart';
import 'package:movie_app/screens/home/components/_commerical_movie_card.dart';
import 'package:movie_app/screens/home/components/_custom_divider.dart';
import 'package:movie_app/screens/home/components/_custom_icon_text_button.dart';
import 'package:movie_app/utils/_now_paying_db.dart';
import 'package:movie_app/utils/_upcoming_movies_db.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.auth, required this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.movie, 0),
          buildNavBarItem(Icons.closed_caption, 1),
          buildNavBarItem(Icons.animation, 2),
          buildNavBarItem(Icons.person, 3),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding / 2,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        icon: Icons.where_to_vote,
                        title: 'CMB',
                        press: () {},
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5)),
                      Expanded(
                        child: CustomIconButton(
                          icon: Icons.search,
                          title: 'Search for movie...',
                          press: () {},
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: defaultPadding,
                    left: defaultPadding,
                    right: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DefaultTextStyle(
                      style: GoogleFonts.poppins(
                          fontSize: defaultPadding * 1.75,
                          color: backgroundColor),
                      child: const Text(
                        "Coming Soon",
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'This Month',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: backgroundColor),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Upcoming',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: shadedTextColor),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: comingSoonMovies
                                .map((item) => ComingSoonCard(
                                    image: item["image"],
                                    title: item["title"],
                                    issueDate: item["issue"]))
                                .toList()),
                      ),
                      const CustomDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: DefaultTextStyle(
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: shadedTextColor,
                              ),
                              child: const Text(
                                'March 2023',
                              ),
                            ),
                          ),
                          Column(
                            children: nowPlayingMovies
                                .map((item) => CommercialMovieCard(
                                    image: item["image"],
                                    title: item["title"],
                                    description: item["description"],
                                    genres: item["genres"],
                                    premierTag: item["premierTag"],
                                    onPress: () {}))
                                .toList(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = index;
        });
        if (selectedItem == 3) {
          widget.logoutCallback();
        }
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: index == selectedItem
            ? BoxDecoration(
                border: const Border(
                    bottom: BorderSide(width: 4, color: colorRedButton)),
                color: kPrimaryColor,
                gradient: LinearGradient(colors: [
                  colorRedButton.withOpacity(0.1),
                  colorRedButton.withOpacity(0.001)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              )
            : const BoxDecoration(),
        child: Icon(icon,
            color: index == selectedItem ? colorRedButton : backgroundColor),
      ),
    );
  }
}
