import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/pages/errorScreen.dart';
import 'package:twitter_clone/pages/homepage.dart';
import 'package:twitter_clone/pages/loadingScreen.dart';
import 'package:twitter_clone/pages/login_signup_screen.dart';
import '../pages/authenticationPage.dart';
import 'package:twitter_clone/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MainApp()));
}

final initializeFirebase = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final initialize = watch(initializeFirebase);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TwitterTheme.lightTheme(context),
      home: initialize.when(
          data: (data) {
            print(data);
            return WelcomePage();
          },
          loading: () => LoadingScreen(),
          error: (e, stackTrace) => ErrorScreen()),
      routes: {
        HomePage.routename: (ctx) => HomePage(),
        LoginScreen.routename: (ctx) => LoginScreen(),
      },
    );
  }
}
