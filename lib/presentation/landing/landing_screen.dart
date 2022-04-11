import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _LandingButton(onTap: () {}, title: 'Zaloguj'),
            const SizedBox(height: 16),
            _LandingButton(onTap: () {}, title: 'Zarejestruj'),
            const SizedBox(height: 16),
            _LandingButton(onTap: () {}, title: 'Gość'),
          ],
        ),
      ),
    );
  }
}

class _LandingButton extends StatelessWidget {
  const _LandingButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}
