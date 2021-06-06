import 'package:acientbay/src/common/net/rest/colleciton_api_provider.dart';
import 'package:acientbay/src/models/api/request/collection_request.dart';
import 'package:acientbay/src/models/collection.dart';


class CollectionRepository {

  final moviesApiProvider = CollectionApiProvider();

  Future<List<Collection>> fetchMovieList(CollectionRequest request) => moviesApiProvider.fetchCollectionList(request);

}