import 'package:laftel_clone/domain/model/theme_anime_model.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_specific_anime.dart';
import '../../../model/simple_anime_model.dart';

class GetSpecificAnimeImpl implements GetSpecificAnime {
  final AnimeRepository _repository;

  const GetSpecificAnimeImpl({
    required AnimeRepository repository,
  }) : _repository = repository;

  @override
  Future<List<SimpleAnimeModel>> getQuarter(String year, String quarter) async {
    return await _repository.getQuarterAnime(year, quarter);
  }
  @override
  Future<List<ThemeAnimeModel>> getTheme() async {
    return await _repository.getThemeAnimeModel();
  }
}