
import 'package:acientbay/src/page/home/home_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';

class Home extends HookWidget{
  @override
  Widget build(BuildContext context) {

    PageStorageBucket pageStorageBucket = PageStorageBucket();
    ScrollController scrollController = ScrollController();

    return PageStorage(
      bucket: pageStorageBucket,
      child: Scaffold(
        appBar: AppBar(
          title: Text('cruise'),
          brightness: Brightness.light, // or use Brightness.dark
          actions: [],
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification){
            //scrollController.animateTo(scrollController.offset, duration: Duration(milliseconds: 1000), curve: Curves.ease);
            return true;
          },
          child: CupertinoScrollbar(
              child:CustomScrollView(
                key: PageStorageKey(1),
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(child: HomeDetail())
                ],
        ),
      ),
    )));
  }
}


