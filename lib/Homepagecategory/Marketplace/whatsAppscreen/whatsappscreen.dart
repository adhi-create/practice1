import 'package:flutter/material.dart';

class whatsappscreen extends StatelessWidget {
  const whatsappscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.white,
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(150.0),
                  child: Image.asset('assets/whatsapp.png'),
                ),
              ),
            ),
            Container(
              child: const Text(
                'JOIN US ON',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent),
              ),
            )
          ],
        ));
  }
}
