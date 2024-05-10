import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upt_test/app.dart';
import 'package:upt_test/services/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeLocator();
  runApp(App());
}
