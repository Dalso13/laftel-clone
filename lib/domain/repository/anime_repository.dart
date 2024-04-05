import '../../core/result.dart';
import '../model/detail_anime_model.dart';
import '../model/search_anime_model.dart';
import '../model/simple_anime_model.dart';
import '../model/theme_anime_model.dart';

abstract interface class AnimeRepository {
  Future<List<SimpleAnimeModel>> getQuarterAnime(String year, String quarter);
  Future<List<ThemeAnimeModel>> getThemeAnimeModel();
  Future<Result<DetailAnimeModel>> getDetailAnimeModel({required int id});
  Future<SearchAnimeModel> getFinderAnimeList();
  Future<SearchAnimeModel> getSearchAnimeList({required String query});
  Future<SearchAnimeModel> getSearchNextAnimeList({required String next});
  Future<SearchAnimeModel> getFinderNextAnimeList({required String next});
}