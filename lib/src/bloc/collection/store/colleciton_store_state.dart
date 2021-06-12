part of 'collection_store_bloc.dart';

class CollectionStoreState extends Equatable {
  CollectionStoreState({
     this.collections,
  });

  final List<CollectionStore>? collections;

  CollectionStoreState copyWith({
    List<CollectionStore>? collections
  }) {
    return CollectionStoreState(
        collections: collections??this.collections
    );
  }

  @override
  List<Object> get props => [collections??[]];
}