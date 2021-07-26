import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/pages/homepage.dart';
import 'package:twitter_clone/providers/auth_provider.dart';

import 'package:twitter_clone/themes.dart';

enum Status { signup, login }

late Status type = Status.login;

class LoginScreen extends StatefulWidget {
  static const routename = '/LoginScreen';

  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;
  void updateEmail(BuildContext context, String email) {}

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void loading() {
    if (_isLoading == true)
      setState(() {
        _isLoading = false;
      });
    else
      setState(() {
        _isLoading = true;
      });
  }

  void _switchType() {
    if (type == Status.signup) {
      setState(() {
        type = Status.login;
      });
    } else {
      setState(() {
        type = Status.signup;
      });
    }
    print(type);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: TwitterTheme.blueTColor,
      body: SafeArea(
        child: Consumer(builder: (context, watch, _) {
          final _auth = watch(authServicesProvider);
          return Form(
            key: _formKey,
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
                                child: Hero(
                                  tag: 'Twitter',
                                  child: Icon(
                                    LineIcons.twitter,
                                    color: Colors.white,
                                    size: 80,
                                  ),
                                )),
                          ),
                        ),
                        // if(1+1 == 2) ...[
                        //  you can use like this but not curly braces one
                        // ],
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
                            controller: _email,
                            autocorrect: true,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Email address',
                              icon: Icon(Icons.email_outlined,
                                  color: TwitterTheme.blueTColor, size: 24),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
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
                            controller: _password,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              icon: Icon(CupertinoIcons.lock_circle,
                                  color: TwitterTheme.blueTColor, size: 24),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        if (type == Status.signup)
                          AnimatedContainer(
                            duration: Duration(milliseconds: 600),
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
                                hintText: 'Confirm password',
                                icon: Icon(CupertinoIcons.lock_circle,
                                    color: TwitterTheme.blueTColor, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                              validator: type == Status.signup
                                  ? (value) {
                                      if (value != _password.text) {
                                        return 'Passwords do not match!';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),

                        if (type == Status.login)
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
                            child: _isLoading
                                ? Center(child: CircularProgressIndicator())
                                : MaterialButton(
                                    onPressed: () async {
                                      //  TODO: Seperate The Logic from Widgets
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }
                                      if (type == Status.login) {
                                        await _auth.signInWithEmailAndPassword(
                                            _email.text, _password.text);
                                        loading();
                                        _auth.authStateChange.listen((event) {
                                          if (event == null) {
                                            print(event);
                                          } else {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    HomePage.routename);
                                          }
                                        });
                                      } else {
                                        await _auth.signUpWithEmailAndPassword(
                                            _email.text, _email.text);
                                        loading();
                                        _auth.authStateChange.listen((event) {
                                          if (event == null) {
                                            print(event);
                                          } else {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    HomePage.routename);
                                          }
                                        });
                                      }
                                    },
                                    child: Text(
                                      type == Status.login
                                          ? 'Log in'
                                          : 'Sign up',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    textColor: TwitterTheme.blueTColor,
                                    textTheme: ButtonTextTheme.primary,
                                    minWidth: 100,
                                    padding: const EdgeInsets.all(18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: TwitterTheme.blueTColor),
                                    ),
                                  ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: RichText(
                              text: TextSpan(
                                text: type == Status.login
                                    ? 'New to Twitter? '
                                    : 'Already to Twitter? ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: type == Status.login
                                          ? 'Sign up now'
                                          : 'Log in',
                                      style: TextStyle(
                                          color: TwitterTheme.blueTColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _switchType();
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
          );
        }),
      ),
    );
  }
}
