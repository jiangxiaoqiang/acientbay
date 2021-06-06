part of 'collection_bloc.dart';

class CollectionState extends Equatable {
   CollectionState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
     this.collections,
  });

  final FormzStatus status;
  final Username username;
  final Password password;
  final List<Collection>? collections;

  CollectionState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    int? selectNavIndex,
    List<Collection>? collections
  }) {
    return CollectionState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
        collections: collections??this.collections
    );
  }

  @override
  List<Object> get props => [status, username, password];
}