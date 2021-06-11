part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class CollectionValueChanged extends CollectionEvent{
  const CollectionValueChanged(this.collections);

  final List<Collection> collections;

  @override
  List<Object> get props => [collections];
}
