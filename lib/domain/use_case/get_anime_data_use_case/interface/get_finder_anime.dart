import '../../../model/search_anime_model.dart';

abstract interface class GetFinderAnime {
  Future<SearchAnimeModel> getFinderAnime();
  Future<SearchAnimeModel> getNextAnime({required String next});
}
