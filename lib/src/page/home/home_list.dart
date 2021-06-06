
import 'package:acientbay/src/bloc/collection/collection_bloc.dart';
import 'package:acientbay/src/bloc/nav/nav_bloc.dart';
import 'package:acientbay/src/models/api/request/collection_request.dart';
import 'package:acientbay/src/models/collection.dart';
import 'package:acientbay/src/repo/collection_repository.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'home_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_card.dart';

class HomeList extends HookWidget {

  @override
  Widget build(BuildContext context) {



    final collections = context.select(
          (CollectionBloc bloc) => bloc.state.collections,
    );

    if(collections == null || collections.isEmpty){
      return Center(child: CircularProgressIndicator());
    }

    return SafeArea(child: CustomScrollView(
        slivers: <Widget>[ SliverList(
        delegate: SliverChildBuilderDelegate((context, index){
          return Slidable(
            key: Key(collections[index].id.toString()),
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
          childCount: collections.length
    ))]));
  }
}


