import '../../../model/search_anime_model.dart';

abstract interface class GetSearchAnime {
  Future<SearchAnimeModel> getSearchAnime();

  Future<SearchAnimeModel> getNextAnime({required String next});
}
