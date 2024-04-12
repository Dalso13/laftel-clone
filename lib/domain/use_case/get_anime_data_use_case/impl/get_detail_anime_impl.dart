import 'package:laftel_clone/domain/repository/anime_repository.dart';

import '../../../../core/result.dart';
import '../../../model/detail_anime_model.dart';
import '../../../model/episode_anime_model.dart';
import '../interface/get_detail_anime.dart';

class GetDetailAnimeImpl implements GetDetailAnime {
  final AnimeRepository _repository;

  GetDetailAnimeImpl({
    required AnimeRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<DetailAnimeModel>> getDetailAnimeModel({required int id}) async {
    return await _repository.getDetailAnimeModel(id: id);
  }

  @override
  Future<List<EpisodeAnimeModel>> getEpisodeAnimeModel({required int id}) async {
    return await _repository.getEpisodeAnimeModel(id: id);
  }
}