import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TracksScreen extends StatelessWidget {
  final String playlistId;

  const TracksScreen({super.key, required this.playlistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tracks')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('demo')
            .doc(playlistId)
            .collection('love')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return ExpansionTile(
                title: Text(doc['love']),
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('demo')
                        .doc(playlistId)
                        .collection('love')
                        .doc(doc.id)
                        .collection('storys')
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot> detailsSnapshot) {
                      if (!detailsSnapshot.hasData) {
                        return const CircularProgressIndicator();
                      }

                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: detailsSnapshot.data!.docs.map((detailDoc) {
                          return ListTile(
                            title: Text(detailDoc['love']),
                            onTap: () {
                              // Handle playing the track, for example, by navigating to a player screen
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
