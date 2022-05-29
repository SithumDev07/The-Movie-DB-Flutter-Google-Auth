import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/_constants.dart';
import 'package:movie_app/auth/authentication_dart.dart';
import 'package:movie_app/screens/home/_home.dart';
import 'package:movie_app/screens/login/components/_custom_text_filed.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return SafeArea(
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
                margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                padding: const EdgeInsets.symmetric(
                    horizontal: 13, vertical: defaultPadding * .9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: colorRedButton),
                child: GestureDetector(
                  onTap: () {
                    context.read<AuthenticationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
    
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const Home()));
                  },
                  child: Center(
                    child: Text('Sign in',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: backgroundColor,
                            fontWeight: FontWeight.bold)),
                  ),
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
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: shadedTextColor),
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
        )
    );
  }
}
