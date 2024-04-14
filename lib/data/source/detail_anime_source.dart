import 'dart:convert';

import 'package:http/http.dart' as http;

class DetailAnimeSource {
  Future<Map<String, dynamic>> getAnimeInfo(int id) async {
    return await _getResponse('https://laftel.net/api/items/v2/$id');
  }

  Future<Map<String, dynamic>> getEpisode(int id) async {

    Map<String, dynamic> data = await _getResponse(
        'https://laftel.net/api/episodes/v2/list/?item_id=$id&sort=oldest&show_playback_offset=true&offset=0');

    final List<dynamic> result = data['results'];

    if (data.isNotEmpty) {
      while (data['next'] != null) {
        data = await _getResponse(data['next']);
        final List<dynamic> nextResult = data['results'];
        result.addAll(nextResult);
      }
      data['results'] = result;
    }
    return data;
  }

  Future<Map<String, dynamic>> getSeries(int id) async {
    return await _getResponse('https://laftel.net/api/items/v2/series/$id');
  }

  Future<Map<String, dynamic>> _getResponse(String url) async {
    final response = await http.get(Uri.parse(url), headers: {
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
