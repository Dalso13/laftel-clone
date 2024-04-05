import 'package:laftel_clone/domain/model/search_anime_model.dart';

import '../../../repository/anime_repository.dart';
import '../interface/get_finder_anime.dart';

class GetFinderAnimeImpl implements GetFinderAnime{

  final AnimeRepository _repository;

  const GetFinderAnimeImpl({
    required AnimeRepository repository,
  }) : _repository = repository;

  @override
  Future<SearchAnimeModel> getFinderAnime() {
    return _repository.getFinderAnimeList();
  }

  @override
  Future<SearchAnimeModel> getNextAnime({required String next}) {
    return _repository.getFinderNextAnimeList(next: next);
  }
}