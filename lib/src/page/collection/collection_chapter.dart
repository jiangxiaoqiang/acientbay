import 'package:acientbay/src/bloc/collection/store/collection_store_bloc.dart';
import 'package:acientbay/src/models/api/request/collection_request.dart';
import 'package:acientbay/src/models/collection_store.dart';
import 'package:acientbay/src/page/home/home_detail.dart';
import 'package:acientbay/src/page/home/item_card.dart';
import 'package:acientbay/src/repo/collection_store_repository.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wheel/wheel.dart';

class CollectionChapter extends HookWidget {

  const CollectionChapter({
    Key? key,
    required this.collectionId
  }) : super(key: key);


  final int collectionId;

  @override
  Widget build(BuildContext context) {
    final collections = context.select(
      (CollectionStoreBloc bloc) => bloc.state.collectionStores,
    );

    loadCollectionStore() async {
      var collectionStore = CollectionStoreRepository();
      CollectionRequest request = CollectionRequest(-1, "", -1);
      request.collectionName = "demo";
      request.id = collectionId;
      SecureStorageUtil.putString("token", "1");
      List<CollectionStore> deg = await collectionStore.fetchMovieList(request);
      context.read<CollectionStoreBloc>().add(CollectionStoreValueChanged(deg));
    }

    useEffect(() {
      Future.microtask(() => loadCollectionStore());
    }, []);

    if (collections == null || collections.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    Offset? _initialSwipeOffset;
    Offset? _finalSwipeOffset;

    void _onHorizontalDragStart(DragStartDetails details) {
      _initialSwipeOffset = details.globalPosition;
    }

    void _onHorizontalDragUpdate(DragUpdateDetails details) {
      _finalSwipeOffset = details.globalPosition;
    }

    void _onHorizontalDragEnd(DragEndDetails details) {
      if (_initialSwipeOffset != null) {
        final offsetDifference = _initialSwipeOffset!.dx - _finalSwipeOffset!.dx;
        if (offsetDifference < 0) {
          Navigator.pop(context);
        }
      }
    }

    return GestureDetector(
        onHorizontalDragStart: _onHorizontalDragStart,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child:SafeArea(
        child: CustomScrollView(slivers: <Widget>[
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Slidable(
          key: Key(collections[index].id.toString()),
          actionPane: SlidableScrollActionPane(),
          child: OpenContainer(
            tappable: true,
            closedElevation: 0,
            transitionDuration: Duration(milliseconds: 500),
            closedBuilder: (BuildContext c, VoidCallback action) => ItemCard(name: collections[index].storeTitle),
            openBuilder: (BuildContext c, VoidCallback action) => ChapterDetail(storeContent: collections[index].storeContent,),
          ),
        );
      }, childCount: collections.length))
    ])));
  }
}
