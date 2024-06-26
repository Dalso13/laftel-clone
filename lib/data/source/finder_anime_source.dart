import 'dart:convert';

import 'package:http/http.dart' as http;

class FinderAnimeSource {
  Future<Map<String, dynamic>> getFinderAnimeList({
    required List<String> years,
    required List<String> genres,
    required List<String> tags,
    required List<String> broadcasts,
    required List<String> releases,
    required List<String> brands,
  }) async {
    StringBuffer uri =
        StringBuffer('https://laftel.net/api/search/v1/discover/?');

    if (years.isNotEmpty)uri.write('years=$years&');
    if (genres.isNotEmpty)uri.write('genres=$genres&');
    if (tags.isNotEmpty)uri.write('tags=$tags&');
    if (broadcasts.isNotEmpty)uri.write('broadcasts=$broadcasts&');
    if (releases.isNotEmpty)uri.write('releases=$releases&');
    if (brands.isNotEmpty)uri.write('brands=$brands&');

    return await _getAnimeList(uri: uri.toString());
  }

  Future<Map<String, dynamic>> getNextAnimeList({required String next}) async {
    return await _getAnimeList(uri: next);
  }

  Future<Map<String, dynamic>> _getAnimeList({required String uri}) async {
    final response = await http.get(Uri.parse(uri), headers: {
      "laftel": "TeJava",
      "User-Agent":
          "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1_4; like Mac OS X) AppleWebKit/600.11 (KHTML, like Gecko)  Chrome/54.0.1486.383 Mobile Safari/600.8",
    });

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return {};
  }
}
