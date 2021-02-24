import 'package:flutter/material.dart';
import './board_firestore/board_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    home: BoardApp(),
  ));
}
