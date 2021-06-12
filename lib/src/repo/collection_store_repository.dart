import 'package:acientbay/src/common/net/rest/colleciton_store_api_provider.dart';
import 'package:acientbay/src/models/api/request/collection_request.dart';
import 'package:acientbay/src/models/collection_store.dart';


class CollectionStoreRepository {

  final moviesApiProvider = CollectionStoreApiProvider();

  Future<List<CollectionStore>> fetchMovieList(CollectionRequest request) => moviesApiProvider.fetchCollectionStoreList(request);

}