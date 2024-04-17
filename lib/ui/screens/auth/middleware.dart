import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healify/ui/screens/auth/signin.dart';
import 'package:healify/ui/screens/profile/CreateProfile.dart';

class Middleware extends StatelessWidget {
  const Middleware({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CreateProfile();
            } else {
              return const SignIn();
            }
          }),
    );
    ;
  }
}
