part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class FetchCollection extends CollectionEvent{
  const FetchCollection(this.collections);

  final List<Collection> collections;

  @override
  List<Object> get props => [collections];
}

class LoginUsernameChanged extends CollectionEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends CollectionEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends CollectionEvent {
  const LoginSubmitted();
}