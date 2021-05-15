
import 'package:acientbay/src/page/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeNav extends HookWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '我的'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '我的1')
        ],
          currentIndex:1
      ),
    );
  }
}


