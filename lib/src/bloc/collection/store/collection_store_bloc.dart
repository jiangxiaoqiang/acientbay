import 'dart:async';

import 'package:acientbay/src/models/collection.dart';
import 'package:acientbay/src/models/collection_store.dart';
import 'package:acientbay/src/repo/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'collection_store_event.dart';
part 'colleciton_store_state.dart';

class CollectionStoreBloc extends Bloc<CollectionStoreEvent, CollectionStoreState> {
  CollectionStoreBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(CollectionStoreState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<CollectionStoreState> mapEventToState(
      CollectionStoreEvent event,
      ) async* {
     if(event is CollectionStoreValueChanged){
      yield _mapFetchCollectionStoreChangedToState(event, state);
    }
  }

  CollectionStoreState _mapFetchCollectionStoreChangedToState(
      CollectionStoreValueChanged event,
      CollectionStoreState state,
      ) {
    return state.copyWith(
      collections: event.collectionStores,
    );
  }
}