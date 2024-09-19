import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:providerpractice/authentication/features/app/splash_screen/splash_screen.dart';
import 'package:providerpractice/authentication/features/user_auth/presentation/pages/home_page.dart';
import 'package:providerpractice/authentication/features/user_auth/presentation/pages/login_page.dart';
import 'package:providerpractice/authentication/features/user_auth/presentation/pages/sign_up_page.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  var Auth = FirebaseAuth.instance;
  var isLogin = false;

  checkIfLogin() {
    Auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => isLogin
            ? profilepage()
            : const SplashScreen(
                // Here, you can decide whether to show the LoginPage or HomePage based on user authentication

                ),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => profilepage(),
      },
    );
  }
}
