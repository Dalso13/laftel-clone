import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laftel_clone/data/dto/simple_anime_dto.dart';

import '../dto/theme_anime_dto.dart';

class SpecificAnimeSource {
  Future<List<SimpleAnimeDto>> getQuarterAnimeList(String year, String quarter) async {
    var response = await http.get(Uri.parse(
        'https://laftel.net/api/search/v1/discover/?years=$year년%20$quarter분기'));

    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> data = json['results'];

    // TODO: 모든 리스트 가져올려면 실행해야하지만 자주 호출하면 혼날까봐 패스
    // while (true) {
    //   if (json['next'] != null) {
    //     response = await http.get(Uri.parse('${json['next']}'));
    //     json = jsonDecode(utf8.decode(response.bodyBytes));
    //     data.addAll(json['results']);
    //   } else {
    //     break;
    //   }
    // }
    return data.map((e) => SimpleAnimeDto.fromJson(e)).toList();
  }
  Future<List<ThemeAnimeDto>> getThemeAnimeList() async {
    var response = await http.get(Uri.parse(
        'https://laftel.net/api/recommends/v1/themes/?limit=3'));
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> data = json['results'];

    // TODO: 모든 리스트 가져올려면 실행해야하지만 자주 호출하면 혼날까봐 패스
    // while (true) {
    //   if (json['next'] != null) {
    //     response = await http.get(Uri.parse('${json['next']}'));
    //     json = jsonDecode(utf8.decode(response.bodyBytes));
    //     data.addAll(json['results']);
    //   } else {
    //     break;
    //   }
    // }
    return data.map((e) => ThemeAnimeDto.fromJson(e)).toList();
  }
}
