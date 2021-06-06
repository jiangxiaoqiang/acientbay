part of 'nav_bloc.dart';

abstract class NavEvent extends Equatable {
  const NavEvent();

  @override
  List<Object> get props => [];
}

class NavSelectIndexChanged extends NavEvent{
  const NavSelectIndexChanged(this.selectIndex);

  final int selectIndex;

  @override
  List<Object> get props => [selectIndex];
}

class LoginUsernameChanged extends NavEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends NavEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends NavEvent {
  const LoginSubmitted();
}