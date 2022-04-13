import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glogow_mlp/domain/data_source/auth_data_source/auth_data_source.dart';
import 'package:glogow_mlp/domain/service/user_service.dart';
import 'package:glogow_mlp/presentation/common/auth_bloc/auth_bloc.dart';
import 'package:glogow_mlp/presentation/landing/landing_screen.dart';
import 'package:glogow_mlp/presentation/screens/home/home_screen.dart';
import 'package:glogow_mlp/presentation/screens/login/login_screen.dart';
import 'package:glogow_mlp/presentation/screens/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlogowMlpApplication extends StatelessWidget {
  const GlogowMlpApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            LandingScreen.routeName: (context) => const LandingScreen(),
          },
          home: SplashScreen(),
        ),
      ),
    );
  }
}
