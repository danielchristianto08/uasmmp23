import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uasmmp23/firebase_options.dart';
import 'package:uasmmp23/login.dart';
import 'package:uasmmp23/myliverpool.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const myLiverpool(),
    );
  }
}
