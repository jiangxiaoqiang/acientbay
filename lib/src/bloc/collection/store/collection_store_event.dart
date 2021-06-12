part of 'collection_store_bloc.dart';

abstract class CollectionStoreEvent extends Equatable {
  const CollectionStoreEvent();

  @override
  List<Object> get props => [];
}

class CollectionStoreValueChanged extends CollectionStoreEvent{
  const CollectionStoreValueChanged(this.collections);

  final List<CollectionStore> collections;

  @override
  List<Object> get props => [collections];
}


