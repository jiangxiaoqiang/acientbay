part of 'nav_bloc.dart';

class NavState extends Equatable {
  const NavState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.selectNavIndex = 1
  });

  final FormzStatus status;
  final Username username;
  final Password password;
  final int selectNavIndex;

  NavState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    int? selectNavIndex
  }) {
    return NavState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      selectNavIndex: selectNavIndex??this.selectNavIndex
    );
  }

  @override
  List<Object> get props => [status, username, password, selectNavIndex];
}