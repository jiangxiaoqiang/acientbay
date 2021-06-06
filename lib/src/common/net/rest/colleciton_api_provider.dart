
import 'dart:collection';

import 'package:acientbay/src/models/api/request/collection_request.dart';
import 'package:acientbay/src/models/collection.dart';
import 'package:wheel/wheel.dart';

class CollectionApiProvider{

  Future<List<Collection>> fetchMovieList(CollectionRequest request) async {
    String url = "/acientbay/collection/page";
    Map jsonMap = request.toMap();
    final response = await RestClient.postHttp(url, jsonMap);
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

