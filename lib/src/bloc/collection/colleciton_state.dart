part of 'collection_bloc.dart';

class CollectionState extends Equatable {
   CollectionState({
     this.collections,
  });

  final List<Collection>? collections;

  CollectionState copyWith({
    List<Collection>? collections
  }) {
    return CollectionState(
        collections: collections??this.collections
    );
  }

  @override
  List<Object> get props => [collections??[]];
}