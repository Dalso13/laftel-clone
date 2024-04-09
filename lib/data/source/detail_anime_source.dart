import 'dart:convert';

import 'package:http/http.dart' as http;

class DetailAnimeSource {
  Future<Map<String,dynamic>> getAnimeInfo(int id) async {
    final response = await http.get(Uri.parse(
        'https://laftel.net/api/items/v2/$id'),headers: {
      "laftel": "TeJava",
      "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1_4; like Mac OS X) AppleWebKit/600.11 (KHTML, like Gecko)  Chrome/54.0.1486.383 Mobile Safari/600.8",
    });

    if(response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return {};
  }
  Future<Map<String,dynamic>> getEpisode(int id) async {
    final response = await http.get(Uri.parse(
        'https://laftel.net/api/episodes/v2/list/?item_id=$id&sort=oldest&show_playback_offset=true&offset=0'),headers: {
      "laftel": "TeJava",
      "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1_4; like Mac OS X) AppleWebKit/600.11 (KHTML, like Gecko)  Chrome/54.0.1486.383 Mobile Safari/600.8",
    });

    if(response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return {};
  }
  Future<Map<String,dynamic>> getSeries(int id) async {
    final response = await http.get(Uri.parse(
        'https://laftel.net/api/items/v2/series/$id'),headers: {
      "laftel": "TeJava",
      "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1_4; like Mac OS X) AppleWebKit/600.11 (KHTML, like Gecko)  Chrome/54.0.1486.383 Mobile Safari/600.8",
    });

    if(response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return {};
  }
}
