import 'dart:async';

import 'package:acientbay/src/models/collection.dart';
import 'package:acientbay/src/models/password.dart';
import 'package:acientbay/src/models/username.dart';
import 'package:acientbay/src/repo/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

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
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    } else if(event is FetchCollection){
      yield _mapFetchCollectionChangedToState(event, state);
    }
  }

  CollectionState _mapUsernameChangedToState(
      LoginUsernameChanged event,
      CollectionState state,
      ) {
    final username = Username.dirty(event.username);
    return state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    );
  }

  CollectionState _mapFetchCollectionChangedToState(
      FetchCollection event,
      CollectionState state,
      ) {
    return state.copyWith(
      collections: event.collections,
    );
  }

  CollectionState _mapPasswordChangedToState(
      LoginPasswordChanged event,
      CollectionState state,
      ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    );
  }

  Stream<CollectionState> _mapLoginSubmittedToState(
      LoginSubmitted event,
      CollectionState state,
      ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _authenticationRepository.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } on Exception catch (_) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}