import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/themes.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterTheme.blueTColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 160, 0, 32),
                child: Icon(
                  LineIcons.twitter,
                  color: Colors.white,
                  size: 40,
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
                  MaterialButton(
                    onPressed: () {},
                    child: Text('Sign up'),
                    color: Colors.white,
                    textColor: TwitterTheme.blueTColor,
                    textTheme: ButtonTextTheme.primary,
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Log in',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    textColor: Colors.white,
                    textTheme: ButtonTextTheme.primary,
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white),
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
