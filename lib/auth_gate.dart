import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'tasks.dart';

class AuthVerify extends StatelessWidget {
  const AuthVerify({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
              providers: [
                EmailAuthProvider(),
              ],
              headerBuilder: (context, Constraints, shrinkOffset) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(aspectRatio: 1),
                );
              });
        }

        return const Tasks();
      },
    );
  }
}
