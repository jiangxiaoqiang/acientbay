
import 'package:acientbay/src/page/home/home_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeNav extends HookWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeList(),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '作品库'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '我的')
        ],
          currentIndex:1
      ),
    );
  }
}


