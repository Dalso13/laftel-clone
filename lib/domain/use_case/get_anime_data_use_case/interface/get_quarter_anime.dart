import '../../../model/simple_anime_model.dart';

abstract interface class GetQuarterAnime {
  Future<List<SimpleAnimeModel>> execute(String year, String quarter);
}