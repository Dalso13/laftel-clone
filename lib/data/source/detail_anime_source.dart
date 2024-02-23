import 'dart:convert';

import 'package:http/http.dart' as http;

class DetailAnimeSource {
  Future<Map<String,dynamic>> getSource(int id) async {
    final response = await http.get(Uri.parse(
        'https://laftel.net/api/v1.0/items/$id/detail/'));

    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

    return json;
  }
}
