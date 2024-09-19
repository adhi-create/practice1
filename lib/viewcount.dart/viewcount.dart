import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewCounterScreen extends StatefulWidget {
  @override
  _ViewCounterScreenState createState() => _ViewCounterScreenState();
}

class _ViewCounterScreenState extends State<ViewCounterScreen> {
  int _clickCount = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch the current view count from Firestore
  Future<void> fetchViewCount() async {
    DocumentSnapshot snapshot =
        await _firestore.collection('count').doc('viewpoint').get();
    if (snapshot.exists) {
      setState(() {
        _clickCount = snapshot['counts'] ?? 0;
      });
    }
  }

  // Increment the click count and update Firebase
  Future<void> _incrementClickCount() async {
    setState(() {
      _clickCount++;
    });

    // Save the updated click count to Firestore
    await _firestore.collection('count').doc('viewpoint').set({
      'counts': _clickCount,
    });
  }

  @override
  void initState() {
    super.initState();
    fetchViewCount(); // Fetch view count when screen is loaded
    _incrementClickCount(); // Increment view count when the screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This page has been viewed this many times:',
            ),
            Text(
              '$_clickCount',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _incrementClickCount, // Increment count on button click
              child: Text('Click Me!'),
            ),
          ],
        ),
      ),
    );
  }
}
