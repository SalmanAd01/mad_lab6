import 'package:firebase_test/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCTiU7rWY2EOKgiy5AhllgVx-kXbrhGa0Q",
          authDomain: "madlab-8a7c5.firebaseapp.com",
          databaseURL: "https://madlab-8a7c5-default-rtdb.firebaseio.com",
          projectId: "madlab-8a7c5",
          storageBucket: "madlab-8a7c5.appspot.com",
          messagingSenderId: "915141031898",
          appId: "1:915141031898:web:60ea4c72666d48fee1b2e3",
          measurementId: "G-488CN9LYD1"));
  runApp(MaterialApp(
    home: Signup(),
  ));
}
