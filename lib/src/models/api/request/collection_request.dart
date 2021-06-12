import 'package:equatable/equatable.dart';

class CollectionRequest extends Equatable {
   CollectionRequest(
      this.id,
      this.collectionName,
      this.collectionType
      );

   int id;
  String collectionName;
  final int collectionType;

  @override
  List<Object> get props => [id];

  Map<String, dynamic> toMap() {
    return {
      'collectionName': this.collectionName,
      'id':this.id
    };
  }


}