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

  //static const empty = Collection(-1,'-',-1);

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
      id:json["1"], collectionName:json[""], collectionType: json["d"]
  );

}