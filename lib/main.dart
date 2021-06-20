import 'package:acientbay/src/app/acientbay_app.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:wheel/wheel.dart' show CommonUtils;

void main() {
  GlobalConfiguration().loadFromAsset("app_settings");
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase, collection app crash report
  // https://firebase.flutter.dev/docs/crashlytics/usage/



  runApp(AcientbayApp());
}

