part of 'collection_store_bloc.dart';

abstract class CollectionStoreEvent extends Equatable {
  const CollectionStoreEvent();

  @override
  List<Object> get props => [];
}

class CollectionStoreValueChanged extends CollectionStoreEvent{
  const CollectionStoreValueChanged(this.collectionStores);

  final List<CollectionStore> collectionStores;

  @override
  List<Object> get props => [collectionStores];
}


