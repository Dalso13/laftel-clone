import '../../../model/search_anime_model.dart';

abstract interface class GetFinderAnime {
  Future<SearchAnimeModel> getFinderAnime({
    required List<String> years,
    required List<String> genres,
    required List<String> tags,
    required List<String> broadcasts,
    required List<String> releases,
    required List<String> brands,
  });
  Future<SearchAnimeModel> getNextAnime({required String next});
}
