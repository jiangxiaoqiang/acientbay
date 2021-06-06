import 'package:acientbay/src/app/acientbay_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:wheel/wheel.dart' show CommonUtils;

void main() {
  GlobalConfiguration().loadFromAsset("app_settings");
  CommonUtils.initialApp();

  runApp(AcientbayApp());
}

