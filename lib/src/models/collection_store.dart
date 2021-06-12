import 'package:equatable/equatable.dart';

class CollectionStore {
  CollectionStore({
    required this.id,
    required this.collectionName,
  });

  final int id;
  final String collectionName;

  @override
  List<Object> get props => [id];

  factory CollectionStore.fromMap(Map<String, dynamic> json) => CollectionStore(
      id:json["id"],
      collectionName:json["storeContent"] == null ? "" : json["storeContent"]
  );

}