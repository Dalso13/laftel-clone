import 'package:laftel_clone/domain/model/episode_anime_model.dart';

import '../../../../core/result.dart';
import '../../../model/detail_anime_model.dart';

abstract interface class GetDetailAnime {
  Future<Result<DetailAnimeModel>> getDetailAnimeModel({required int id});
  Future<List<EpisodeAnimeModel>> getEpisodeAnimeModel({required int id});
}