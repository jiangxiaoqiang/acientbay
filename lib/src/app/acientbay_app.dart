
import 'package:acientbay/src/page/home/home_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AcientbayApp extends HookWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Acientbay",
     home: HomeNav(),
   );
  }
}







