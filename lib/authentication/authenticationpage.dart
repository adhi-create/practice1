import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:providerpractice/authentication/openingPage.dart';

class authentication extends StatefulWidget {
  const authentication({super.key});

  @override
  State<authentication> createState() => _authenticationState();
}

class _authenticationState extends State<authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OpeningPage()));
            },
            child: const Text('sign')),
      ),
    );
  }
}
