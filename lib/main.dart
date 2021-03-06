import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometending/src/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(
              child: Text('firebase load fail'),
            );
          }
          if(snapshot.connectionState == ConnectionState.done) {
            return Home();
          }
          return CircularProgressIndicator();
        },
      )
    );
  }
}