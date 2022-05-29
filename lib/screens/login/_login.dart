import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';
import 'package:movie_app/auth/authentication.dart';
import 'package:movie_app/auth/authentication_dart.dart';
import 'package:movie_app/screens/login/components/_custom_text_filed.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.auth, required this.loginCallBack})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback loginCallBack;

  @override
  LoginView createState() => LoginView();
}

class LoginView extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? showCircularProgress()
        : Scaffold(
            backgroundColor: themeColor,
            body: SafeArea(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Welcome
                  Text(
                    'The Movie DB',
                    style: GoogleFonts.bebasNeue(
                      fontSize: defaultPadding * 3,
                      color: backgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Latest movies at your fingertips',
                    style: GoogleFonts.poppins(
                      fontSize: defaultPadding * .75,
                      color: backgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Email
                  CustomInputField(
                    controller: emailController,
                    placeHolder: "Enter Your Email Address",
                    isObscured: false,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  //Password
                  CustomInputField(
                    controller: passwordController,
                    placeHolder: "Enter Your Password",
                    isObscured: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  //Sign in Button
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 0,
                      color: colorRedButton,
                      onPressed: login,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: defaultPadding * .9),
                      child: Text('Sign in',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: backgroundColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),

                  //Register Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't have an account?",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: shadedTextColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: colorRedButton,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<void> login() async {
    if (emailController.text.isNotEmpty) {
      if (passwordController.text.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        var message = await context.read<AuthenticationService>().signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        switch (message) {
          case "user-not-found":
            showToastMessage("Username or password not matching",
                const Duration(milliseconds: 900));
            break;
          case "invalid-email":
            showToastMessage(
                "Invalid Email Address", const Duration(milliseconds: 900));
            break;
          case "user-disabled":
            showToastMessage(
                "Something went wrong, Please contact dev.sithum.com",
                const Duration(milliseconds: 1500));
            break;
          case "wrong-password":
            showToastMessage("Email address and password does not match",
                const Duration(milliseconds: 1000));
            break;
          default:
            widget.loginCallBack();
            break;
        }

        setState(() {
          isLoading = false;
        });
      } else {
        showToastMessage(
            "Password cannot be empty", const Duration(milliseconds: 900));
      }
    } else {
      showToastMessage(
          "Username cannot be empty", const Duration(milliseconds: 900));
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToastMessage(
      String message, Duration milliSeconds) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: colorRedButton,
      duration: milliSeconds,
    ));
  }

  Widget showCircularProgress() {
    return const Center(
      child: CircularProgressIndicator(
        color: colorRedButton,
      ),
    );
  }
}
