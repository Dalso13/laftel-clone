import 'dart:convert';

import 'package:http/http.dart' as http;

class FinderAnimeSource {
  Future<Map<String,dynamic>> getFinderAnimeList() async {
    StringBuffer uri = StringBuffer('https://laftel.net/api/search/v1/discover/');

    return await _getAnimeList(uri: uri.toString());
  }
  Future<Map<String,dynamic>> getNextAnimeList({required String next}) async {
    return await _getAnimeList(uri: next);
  }

  Future<Map<String,dynamic>> _getAnimeList({required String uri}) async {
    final response = await http.get(Uri.parse(uri));

    if(response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return {};
  }
}
