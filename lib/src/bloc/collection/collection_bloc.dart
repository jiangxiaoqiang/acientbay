import 'dart:async';

import 'package:acientbay/src/models/collection.dart';
import 'package:acientbay/src/repo/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'colleciton_event.dart';
part 'colleciton_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(CollectionState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<CollectionState> mapEventToState(
      CollectionEvent event,
      ) async* {
     if(event is CollectionValueChanged){
      yield _mapFetchCollectionChangedToState(event, state);
    }
  }

  CollectionState _mapFetchCollectionChangedToState(
      CollectionValueChanged event,
      CollectionState state,
      ) {
    return state.copyWith(
      collections: event.collections,
    );
  }
}