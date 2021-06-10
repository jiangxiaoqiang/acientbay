
import 'dart:collection';

import 'package:acientbay/src/models/api/request/collection_request.dart';
import 'package:acientbay/src/models/collection.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:wheel/wheel.dart' show GlobalConfig, RestClient;


class CollectionApiProvider{

  Future<List<Collection>> fetchCollectionList(CollectionRequest request) async {

    String url = "/acientbay/collection/page";
    Map jsonMap = request.toMap();
    //var lib =  GlobalConfiguration().get("baseUrl");
    String baseUrl = "https://acientbay-api.poemhub.top";
    String requestUrl = baseUrl + url;

    final response = await RestClient.postHttp(requestUrl, jsonMap);
    if (RestClient.respSuccess(response)) {
      Map result = response.data["result"];
      if (result == null) {
        return List.empty();
      }
      List channels = result["list"];
      List<Collection> items = List.empty(growable: true);
      channels.forEach((element) {
          HashMap<String, Object> map = HashMap.from(element);
          Collection item = Collection.fromMap(map);
          items.add(item);
      });
      return items;
    } else {
      throw Exception('Failed to load post');
    }
  }

}

