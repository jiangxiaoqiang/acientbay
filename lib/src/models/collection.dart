import 'package:equatable/equatable.dart';

class Collection {
  Collection({
    required this.id,
    required this.collectionName,
    required this.collectionType
  });

  final int id;
  final String collectionName;
  final int collectionType;

  @override
  List<Object> get props => [id];

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
      id:json["id"],
      collectionName:json["collectionName"] == null ? 0 : json["collectionName"],
      collectionType: json["collectionType"] == null ? 0 : json["collectionType"]
  );

}