part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class NavSelectIndexChanged extends CollectionEvent{
  const NavSelectIndexChanged(this.selectIndex);

  final int selectIndex;

  @override
  List<Object> get props => [selectIndex];
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