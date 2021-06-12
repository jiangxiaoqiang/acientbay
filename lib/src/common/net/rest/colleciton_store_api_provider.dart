
import 'dart:collection';

import 'package:acientbay/src/models/api/request/collection_request.dart';
import 'package:acientbay/src/models/collection_store.dart';
import 'package:wheel/wheel.dart' show GlobalConfig, RestClient, SecureStorageUtil;


class CollectionStoreApiProvider{

  Future<List<CollectionStore>> fetchCollectionStoreList(CollectionRequest request) async {

    String url = "/acientbay/collection/page/detail";
    Map jsonMap = request.toMap();
    //var lib =  GlobalConfiguration().get("baseUrl");
    String baseUrl = "https://acientbay-api.poemhub.top";
    String requestUrl = baseUrl + url;
    SecureStorageUtil.putString("token", "1");
    final response = await RestClient.postHttp(requestUrl, jsonMap);
    if (RestClient.respSuccess(response)) {
      Map result = response.data["result"];
      if (result == null) {
        return List.empty();
      }
      List channels = result["list"];
      List<CollectionStore> items = List.empty(growable: true);
      channels.forEach((element) {
          HashMap<String, Object> map = HashMap.from(element);
          CollectionStore item = CollectionStore.fromMap(map);
          items.add(item);
      });
      return items;
    } else {
      throw Exception('Failed to load post');
    }
  }

}

