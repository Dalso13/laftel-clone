import '../../../model/search_anime_model.dart';

abstract interface class GetSearchAnime {
  Future<SearchAnimeModel> getSearchAnime({required String query});
  Future<SearchAnimeModel> getNextAnime({required String next});
}