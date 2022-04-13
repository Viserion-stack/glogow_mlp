import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glogow_mlp/firebase_options.dart';
import 'package:glogow_mlp/presentation/application/glogow_mlp_application.dart';

Future<void> mainApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runZonedGuarded(() {
    runApp(
      const GlogowMlpApplication(),
    );
  }, (error, stackTrace) {
    print('runZonedGuarded fail');
  });
}
