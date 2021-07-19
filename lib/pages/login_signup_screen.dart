import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'package:twitter_clone/themes.dart';

enum Status { signup, login, forgotPassword }

class LoginScreen extends StatefulWidget {
  static const routename = '/LoginScreen';

  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ModalRoute.of(context)!.settings.arguments as Status;
    print(state);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: TwitterTheme.blueTColor,
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(top: 64),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 62,
                          child: CircleAvatar(
                              backgroundColor: TwitterTheme.blueTColor,
                              radius: 60,
                              child: Icon(
                                LineIcons.twitter,
                                color: Colors.white,
                                size: 80,
                              )),
                        ),
                      ),
                      Spacer(flex: 2),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          autocorrect: true,
                          enableSuggestions: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            icon: Icon(Icons.mail_outline_rounded,
                                color: TwitterTheme.blueTColor, size: 24),
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            icon: Icon(CupertinoIcons.lock_circle,
                                color: TwitterTheme.blueTColor, size: 24),
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Center(
                        child: InkWell(
                          enableFeedback: true,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Forgot password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 48.0),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'Log in',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            textColor: TwitterTheme.blueTColor,
                            textTheme: ButtonTextTheme.primary,
                            minWidth: 100,
                            padding: const EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: TwitterTheme.blueTColor),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'New to Twitter? ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Sign up now',
                                    style: TextStyle(
                                        color: TwitterTheme.blueTColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('It Works');
                                      })
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
