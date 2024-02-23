import 'package:laftel_clone/core/result.dart';
import 'package:laftel_clone/data/dto/detail_anime_dto.dart';
import 'package:laftel_clone/data/mapper/detail_anime_mapper.dart';
import 'package:laftel_clone/data/mapper/quarter_anime_mapper.dart';
import 'package:laftel_clone/data/mapper/theme_anime_mapper.dart';
import 'package:laftel_clone/data/source/detail_anime_source.dart';
import 'package:laftel_clone/data/source/quarter_anime_source.dart';
import 'package:laftel_clone/data/source/theme_anime_source.dart';
import 'package:laftel_clone/domain/model/detail_anime_model.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';
import 'package:laftel_clone/domain/model/theme_anime_model.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final QuarterAnimeSource _quarterSource;
  final ThemeAnimeSource _themeAnimeSource;
  final DetailAnimeSource _detailAnimeSource;

  const AnimeRepositoryImpl({
    required QuarterAnimeSource quarterSource,
    required ThemeAnimeSource themeAnimeSource,
    required DetailAnimeSource detailAnimeSource,
  })  : _quarterSource = quarterSource,
        _themeAnimeSource = themeAnimeSource,
        _detailAnimeSource = detailAnimeSource;

  @override
  Future<List<SimpleAnimeModel>> getQuarterAnime(String year, String quarter) async {
    final data = await _quarterSource.getSource(year, quarter);

    return data.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<ThemeAnimeModel>> getThemeAnimeModel() async {
    final data = await _themeAnimeSource.getSource();

    return data.map((e) => e.toModel()).toList();
  }

  @override
  Future<Result<DetailAnimeModel>> getDetailAnimeModel({required int id}) async {
    try {
      final data = await _detailAnimeSource.getSource(id);

      final json = DetailAnimeDto.fromJson(data);

      return Result.success(json.toModel());

    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }


}