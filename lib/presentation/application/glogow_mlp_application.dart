import 'package:flutter/material.dart';
import 'package:glogow_mlp/presentation/screens/home/home_screen.dart';

class GlogowMlpApplication extends StatelessWidget {
  const GlogowMlpApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
