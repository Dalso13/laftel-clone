import 'package:laftel_clone/domain/model/search_anime_model.dart';

import '../../../repository/anime_repository.dart';
import '../interface/get_finder_anime.dart';

class GetFinderAnimeImpl implements GetFinderAnime{

  final AnimeRepository _repository;

  const GetFinderAnimeImpl({
    required AnimeRepository repository,
  }) : _repository = repository;

  @override
  Future<SearchAnimeModel> getFinderAnime({
    required List<String> years,
    required List<String> genres,
    required List<String> tags,
    required List<String> broadcasts,
    required List<String> releases,
    required List<String> brands,
  }) {
    return _repository.getFinderAnimeList(
        years: years,
        brands: brands,
        broadcasts: broadcasts,
        genres: genres,
        releases: releases,
        tags: tags
    );
  }

  @override
  Future<SearchAnimeModel> getNextAnime({required String next}) {
    return _repository.getFinderNextAnimeList(next: next);
  }
}