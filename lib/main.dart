import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:instant_gram/state/auth/backend/authenticator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod InstantGram',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: Center(
          child: TextButton(
            child: Text("Sign in with Google"),
            onPressed: () async {
              final result =await Authenticator().LoginWithGoogle();
              log(result.toString());
            },
          ),
        ),
      ),
    );
  }
}
