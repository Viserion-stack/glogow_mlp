import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glogow_mlp/presentation/common/auth_bloc/auth_bloc.dart';
import 'package:glogow_mlp/presentation/landing/landing_screen.dart';
import 'package:glogow_mlp/presentation/screens/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.authStatus != current.authStatus,
      builder: (context, state) {
        if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.of(context).pushNamed(LoginScreen.routeName);
        } else if (state.authStatus == AuthStatus.unknown) {
          Navigator.of(context).pushNamed(LandingScreen.routeName);
        } else {
          Navigator.of(context).pushNamed(LoginScreen.routeName);
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
