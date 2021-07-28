import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/Screens/errorScreen.dart';
import 'package:twitter_clone/pages/homepage.dart';
import 'package:twitter_clone/Screens/loadingScreen.dart';
import 'package:twitter_clone/pages/login_signup_screen.dart';
import 'package:twitter_clone/providers/auth_provider.dart';
import 'pages/WelcomePage.dart';
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
      themeMode: ThemeMode.dark,
      theme: TwitterTheme.lightTheme(context),
      darkTheme: TwitterTheme.darkTheme(context),
      home: initialize.when(
          data: (data) {
            return AuthChecker();
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

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //  this variable is watching the state ki abhi kaha pe hai hum (logged In or not)
    final _authState = watch(authStateProvider);
    return _authState.when(
        data: (data) {
          if (data != null) return HomePage();

          return WelcomePage();
        },
        loading: () => LoadingScreen(),
        error: (e, trace) => ErrorScreen());
  }
}
