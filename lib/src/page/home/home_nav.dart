import 'package:acientbay/src/bloc/nav/nav_bloc.dart';
import 'package:acientbay/src/page/home/home_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeNav extends HookWidget {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      context.read<NavBloc>().add(NavSelectIndexChanged(index));
    }

    final selectNavIndex = context.select(
      (NavBloc bloc) => bloc.state.selectNavIndex,
    );
    return Scaffold(
      body: HomeList(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '作品库'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '我的')
        ],
        currentIndex: selectNavIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
