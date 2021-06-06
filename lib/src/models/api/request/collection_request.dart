import 'package:equatable/equatable.dart';

class CollectionRequest extends Equatable {
  const CollectionRequest(
      this.id,
      this.collectionName,
      this.collectionType
      );

  final int id;
  final String collectionName;
  final int collectionType;

  @override
  List<Object> get props => [id];

  static const empty = CollectionRequest(-1,'-',-1);

  Map<String, dynamic> toMap() {
    return {
      'collectionName': this.collectionName
    };
  }


}