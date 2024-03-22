import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laftel_clone/data/dto/simple_anime_dto.dart';

class SearchAnimeSource {
  Future<Map<String,dynamic>> getSearchAnimeList() async {
    StringBuffer uri = StringBuffer('https://laftel.net/api/search/v1/discover/');

    return await _getAnimeList(uri: uri.toString());
  }
  Future<Map<String,dynamic>> getNextAnimeList({required String next}) async {
    return await _getAnimeList(uri: next);
  }

  Future<Map<String,dynamic>> _getAnimeList({required String uri}) async {
    var response = await http.get(Uri.parse(uri));

    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

    return json;
  }
}
