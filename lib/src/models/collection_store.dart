import 'package:equatable/equatable.dart';

class CollectionStore {
  CollectionStore({
    required this.id,
    required this.storeContent,
    required this.storeTitle
  });

  final int id;
  final String storeContent;
  final String storeTitle;

  @override
  List<Object> get props => [id];

  factory CollectionStore.fromMap(Map<String, dynamic> json) => CollectionStore(
      id:json["id"],
      storeContent:json["storeContent"] == null ? "" : json["storeContent"],
      storeTitle:json["storeTitle"] == null ? "" : json["storeTitle"]

  );

}