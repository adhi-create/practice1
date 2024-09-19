import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final User? user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//         appBar: AppBar(
//           title: Text("HomePage"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Welcome buddy!",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
//               ),
//             )),
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Icon(
//                   Icons.person,
//                   size: 100,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Welcome, ${user?.displayName ?? 'Guest'}',
//                 style: TextStyle(fontSize: 24),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               '@ ${user?.email ?? 'N/A'}',
//               style: TextStyle(fontSize: 18),
//             ),
//             GestureDetector(
//               onTap: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.pushNamed(context, "/login");
//               },
//               child: Container(
//                 height: 45,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                   child: Text(
//                     "Sign out",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _HomePageState();
}

class _HomePageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              child: Image.asset(
                'assets/profilepic.png',
                fit: BoxFit.cover,
              ),

              // backgroundImage: NetworkImage(
              //   'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/blank-profile-picture-973460_1280.png?alt=media&token=1fc6fc79-f042-4a96-aa7a-d7a694ba8ee1&_gl=1*1q5p3ik*_ga*MTk4NTIzMzE1Ni4xNjkyNDY0NzIx*_ga_CW55HF8NVT*MTY5NjQwNjk2My40MC4xLjE2OTY0MDY5OTQuMjkuMC4w', // Replace with your profile image URL
              // ),
            ),
            const SizedBox(height: 20),
            const Text(
              'name', // Replace with user's name
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'User', // Replace with user's profession
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(
                      '@ ${user?.email ?? 'N/A'}', // Replace with user's email
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      '', // Replace with user's phone number
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
              },
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
