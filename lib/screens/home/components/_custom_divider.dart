import 'package:flutter/material.dart';
import 'package:movie_app/_constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 10),
      child: Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: shadedBackgroundColor,
      ),
    );
  }
}
