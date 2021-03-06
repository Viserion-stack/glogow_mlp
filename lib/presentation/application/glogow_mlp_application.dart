import 'package:flutter/material.dart';
import 'package:glogow_mlp/foundation/articles.dart';
import 'package:glogow_mlp/presentation/landing/landing_screen.dart';
import 'package:glogow_mlp/presentation/screens/article_detail_screen/article_detail_screen.dart';
import 'package:glogow_mlp/presentation/screens/auth_gate/auth_gate.dart';
import 'package:glogow_mlp/presentation/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

import 'theme.dart';
import '../screens/splash/splash_screen.dart';

class GlogowMlpApplication extends StatelessWidget {
  const GlogowMlpApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ThemeNotifier()),
        ChangeNotifierProvider.value(
          value: Articles(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, notifier, _) {
          return MaterialApp(
              theme: MyAppTheme.myThemes(notifier.isDark, context),
              debugShowCheckedModeBanner: false,
              routes: {
                //HomeScreen.routeName: (context) => HomeScreen(),
                LoginScreen.routeName: (context) => const LoginScreen(),
                LandingScreen.routeName: (context) => const LandingScreen(),
                AuthGate.routeName: (context) => const AuthGate(),
                ArticleDetailScreen.routeName: (context) =>
                    const ArticleDetailScreen(),
              },
              home: const SplashScreen() //AuthGate(),
              );
        },
      ),
    );
  }
}
