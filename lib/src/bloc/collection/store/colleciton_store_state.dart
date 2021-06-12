part of 'collection_store_bloc.dart';

class CollectionStoreState extends Equatable {
  CollectionStoreState({
     this.collectionStores,
  });

  final List<CollectionStore>? collectionStores;

  CollectionStoreState copyWith({
    List<CollectionStore>? collections
  }) {
    return CollectionStoreState(
        collectionStores: collections??this.collectionStores
    );
  }

  @override
  List<Object> get props => [collectionStores??[]];
}