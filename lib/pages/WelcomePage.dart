/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/pages/login_signup_screen.dart';
import 'package:twitter_clone/themes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: TwitterTheme.blueTColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 160, 0, 32),
                child: Hero(
                  tag: 'Twitter',
                  child: Icon(
                    LineIcons.twitter,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  "Welcome to Twitter",
                  softWrap: true,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text("See what's happening in the world right now",
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routename);
                        type = Status.signup;
                      },
                      child: Text('Sign up'),
                      color: Colors.white,
                      textColor: TwitterTheme.blueTColor,
                      textTheme: ButtonTextTheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routename);
                        type = Status.login;
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      textColor: Colors.white,
                      textTheme: ButtonTextTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
