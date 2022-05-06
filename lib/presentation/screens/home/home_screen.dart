import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('HomeScreen'),
              Text('Witaj ' + user.email!),
              const SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
