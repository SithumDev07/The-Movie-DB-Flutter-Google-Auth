import 'package:flutter/material.dart';
import 'package:movie_app/auth/authentication.dart';
import 'package:movie_app/screens/home/_home.dart';
import 'package:movie_app/screens/loading_screen/loading.dart';
import 'package:movie_app/screens/login/_login.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {
  const RootPage({required this.auth});

  final BaseAuth auth;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String userID = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      print("User is $user");
      setState(() {
        if (user != null) {
          userID = user.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        userID = user!.uid;
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      userID = "";
    });
    widget.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return const LoadingPage();
      case AuthStatus.NOT_LOGGED_IN:
        return Login(
          auth: widget.auth,
          loginCallBack: loginCallback,
        );
      case AuthStatus.LOGGED_IN:
        if (userID.isNotEmpty && userID != null) {
          return Home(
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
        } else {
          return const LoadingPage();
        }
      default:
        return const LoadingPage();
    }
  }
}
