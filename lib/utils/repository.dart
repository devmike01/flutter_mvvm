import 'dart:convert';

import 'package:fluttermvvm/models/discovery.dart';
import 'package:fluttermvvm/utils/newsapis.dart';
import 'package:http/http.dart' as http;

class Repository<T> {
  Future<http.Response> getMoveApi(Map<String, String> params) async {
    params["api_key"] = NewsApis.API_KEY;
    var url =
        Uri.https(NewsApis.BASE_URL, "/${NewsApis.DISCOVER_MOVIE}", params);
    return await http.get(url);
  }

  Future<DiscoveryResponse> getDiscoveryMovies() async {
    var params = Map<String, String>();
    params["include_video"] = NewsApis.FALSE;
    params["language"] = NewsApis.LANGUAGE_EN;
    params["sort_by"] = NewsApis.SORT_BY_POPULARITY;

    http.Response response = await getMoveApi(params);

    return DiscoveryResponse.fromJson(json.decode(response.body));
  }
}
