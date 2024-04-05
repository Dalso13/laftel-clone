import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_search_anime.dart';
import '../../../model/search_anime_model.dart';
import '../../../repository/anime_repository.dart';

class GetSearchAnimeImpl implements GetSearchAnime {
  final AnimeRepository _repository;

  const GetSearchAnimeImpl({
    required AnimeRepository repository,
  }) : _repository = repository;

  @override
  Future<SearchAnimeModel> getSearchAnime({required String query}) {
    return _repository.getSearchAnimeList(query: query);
  }

  @override
  Future<SearchAnimeModel> getNextAnime({required String next}) {
    return _repository.getSearchNextAnimeList(next: next);
  }
}