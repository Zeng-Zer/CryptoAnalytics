import 'package:crypto_analytics/src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('9ef2-89-3-226-208.ngrok-free.app', 80);

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
