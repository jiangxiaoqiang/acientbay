
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'home_detail.dart';
import 'item_card.dart';

class HomeList extends HookWidget {


  @override
  Widget build(BuildContext context) {

    return SafeArea(child: CustomScrollView(
        slivers: <Widget>[ SliverList(
        delegate: SliverChildBuilderDelegate((context, index){
          return Slidable(
            key: Key("1"),
            actionPane: SlidableScrollActionPane(),
            child: OpenContainer(
              tappable: true,
              closedElevation: 0,
              transitionDuration: Duration(milliseconds: 500),
                closedBuilder: (BuildContext c, VoidCallback action) =>
                      ItemCard()
                ,
              openBuilder: (BuildContext c, VoidCallback action) =>
                  HomeDetail(),
            ),
          );
        },
          childCount: 1
    ))]));
  }
}


