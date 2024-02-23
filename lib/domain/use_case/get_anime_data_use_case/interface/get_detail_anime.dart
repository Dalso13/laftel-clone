import '../../../../core/result.dart';
import '../../../model/detail_anime_model.dart';

abstract interface class GetDetailAnime {
  Future<Result<DetailAnimeModel>> getDetailAnimeModel({required int id});
}