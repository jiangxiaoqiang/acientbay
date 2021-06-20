import 'package:acientbay/src/bloc/collection/collection_bloc.dart';
import 'package:acientbay/src/bloc/collection/store/collection_store_bloc.dart';
import 'package:acientbay/src/page/collection/collection_chapter.dart';
import 'package:acientbay/src/repo/authentication_repository.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../item_card.dart';

class NovelBookReaderView extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final collections = context.select(
          (CollectionBloc bloc) => bloc.state.collections,
    );

    if(collections == null || collections.isEmpty){
      return Center(child: CircularProgressIndicator());
    }

    AuthenticationRepository repository =  AuthenticationRepository();

    return Scaffold(
      body: SafeArea(
        child: Container(
          
        ),
      ),
    );
  }
}


