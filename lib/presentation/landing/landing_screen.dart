import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glogow_mlp/presentation/common/auth_bloc/auth_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static const String routeName = '/landing';

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
            _LandingButton(
                onTap: () {
                  context.read<AuthBloc>().add(
                        SignInAnonimouslyRequestedEvent(),
                      );
                },
                title: 'Gość'),
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
