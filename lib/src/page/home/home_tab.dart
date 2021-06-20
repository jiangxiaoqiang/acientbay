import 'package:acientbay/src/bloc/collection/collection_bloc.dart';
import 'package:acientbay/src/page/home/home_list.dart';
import 'package:acientbay/src/repo/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book/novel_book_shelf_view.dart';

class HomeTab extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final collections = context.select(
          (CollectionBloc bloc) => bloc.state.collections,
    );

    if(collections == null || collections.isEmpty){
      return Center(child: CircularProgressIndicator());
    }

    return DefaultTabController(
    length: 2,
        child:Scaffold(
      appBar: AppBar(
        title: Text("Acientbay"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "Novel",
            ),
            Tab(
              text: "发现",
            ),
          ],
        ),
      ),
        body: Container(
          child: TabBarView(
            children: [
              NovelBookShelfView(),
              HomeList()
            ],
          ),
        )));
  }
}


