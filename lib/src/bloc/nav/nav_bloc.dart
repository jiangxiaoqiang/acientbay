import 'dart:async';

import 'package:acientbay/src/models/password.dart';
import 'package:acientbay/src/models/username.dart';
import 'package:acientbay/src/repo/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const NavState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<NavState> mapEventToState(
      NavEvent event,
      ) async* {
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    } else if(event is NavSelectIndexChanged){
      yield _mapNavSelectIndexChangedToState(event, state);
    }
  }

  NavState _mapUsernameChangedToState(
      LoginUsernameChanged event,
      NavState state,
      ) {
    final username = Username.dirty(event.username);
    return state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    );
  }

  NavState _mapNavSelectIndexChangedToState(
      NavSelectIndexChanged event,
      NavState state,
      ) {
    return state.copyWith(
      selectNavIndex: event.selectIndex,
    );
  }

  NavState _mapPasswordChangedToState(
      LoginPasswordChanged event,
      NavState state,
      ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    );
  }

  Stream<NavState> _mapLoginSubmittedToState(
      LoginSubmitted event,
      NavState state,
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