import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:glogow_mlp/presentation/screens/home/home_screen.dart';
import 'package:glogow_mlp/presentation/screens/home/start_screen.dart';

class AuthGate extends StatelessWidget {
  static const routeName = 'Auth-gate';
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            headerBuilder: (context, constraints, shrinkOffset) {
              return Image.asset('assets/logo_glogow.png');
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(action == AuthAction.signIn
                    ? 'Zaloguj się!'
                    : 'Zarejestruj się!'),
              );
            },
            footerBuilder: (context, action) {
              //return AppleSignInButton();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(action == AuthAction.signIn
                    ? 'Logując się akceptujesz regulamin i politykę prywatności!'
                    : 'Rejestrując się akceptujesz regulamin i politykę prywatności!'),
              );
            },
            providerConfigs: const [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                  clientId:
                      '1069158408953-7ovjq2c6o5foesr41rivfhq7l4r91le0.apps.googleusercontent.com'),
              AppleProviderConfiguration()
            ],
          );
        }
        //return HomeScreen();
        return HomeScreen();
      },
    );
  }
}
