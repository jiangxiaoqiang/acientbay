import 'package:equatable/equatable.dart';

class CollectionLegacy extends Equatable {
  const CollectionLegacy(
      this.id,
      this.collectionName,
      this.collectionType
      );

  final int id;
  final String collectionName;
  final int collectionType;

  @override
  List<Object> get props => [id];

  static const empty = CollectionLegacy(-1,'-',-1);

  //factory Collection.fromMap(Map<String, dynamic> json) => Collection(id:json["1"], '1', 1);

}