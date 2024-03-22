import 'package:laftel_clone/domain/model/search_anime_model.dart';

import '../../../repository/anime_repository.dart';
import '../interface/get_search_anime.dart';

class GetSearchAnimeImpl implements GetSearchAnime{

  final AnimeRepository _repository;

  const GetSearchAnimeImpl({
    required AnimeRepository repository,
  }) : _repository = repository;

  @override
  Future<SearchAnimeModel> getSearchAnime() {
    return _repository.getSearchAnimeList();
  }

  @override
  Future<SearchAnimeModel> getNextAnime({required String next}) {
    return _repository.getNextAnimeList(next: next);
  }
}