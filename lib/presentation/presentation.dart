import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glogow_mlp/presentation/application/glogow_mlp_application.dart';

Future<void> mainApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    runApp(
      GlogowMlpApplication(),
    );
  }, (error, stackTrace) {
    print('runZonedGuarded fail');
  });
}
