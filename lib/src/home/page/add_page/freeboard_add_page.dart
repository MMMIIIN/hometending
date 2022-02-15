import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hometending/src/data/freeboard_data.dart';

class FreeBoardAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
                color: Colors.orangeAccent,
                onPressed: () {
                  addFreeBoardData();
                  // print(FirebaseAuth.instance.currentUser!.uid);
                }),
            Row()
          ],
        ),
      ),
    );
  }

  Future<void> addFreeBoardData() async {
    var testData = FreeBoardData(
        content: 'testing',
        username: 'mingwan',
        writeTime: DateTime.now(),
        comments: <FreeBoardComment>[],
        likes: <String>[]);
    await FirebaseFirestore.instance
        .collection('freeboard')
        .add(testData.toJson());
  }
}
