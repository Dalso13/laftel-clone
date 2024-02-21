import '../model/simple_anime_model.dart';

abstract interface class AnimeRepository {
  Future<List<SimpleAnimeModel>> getQuarterAnime(String year, String quarter);
}