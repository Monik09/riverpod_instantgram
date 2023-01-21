import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instant_gram/state/auth/backend/authenticator.dart';
import 'package:instant_gram/state/auth/providers/auth_state_provider.dart';
import 'package:instant_gram/state/auth/providers/is_logged_in_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod InstantGram',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Consumer(builder: ((context, ref, child) {
        bool isLoggedIn = ref.watch(isLoggedInProvider);
        return isLoggedIn ? MainView() : LoginView();
      })),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main view"),
      ),
      body: Center(child: Consumer(
        builder: (context, ref, child) {
          return TextButton(
            onPressed: () async {
              await ref.watch(authStateProvider.notifier).logOut();
            },
            child: Text("Log out!"),
          );
        },
      )),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Login view")),
      body: Center(
        child: TextButton(
          child: Text("Sign in with Google"),
          onPressed: () async {
            await ref.read(authStateProvider.notifier).loginWithGoogle();
          },
        ),
      ),
    );
  }
}
