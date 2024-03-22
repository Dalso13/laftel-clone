import 'package:laftel_clone/core/result.dart';
import 'package:laftel_clone/data/dto/detail_anime_dto.dart';
import 'package:laftel_clone/data/dto/simple_anime_dto.dart';
import 'package:laftel_clone/data/mapper/detail_anime_mapper.dart';
import 'package:laftel_clone/data/mapper/quarter_anime_mapper.dart';
import 'package:laftel_clone/data/mapper/theme_anime_mapper.dart';
import 'package:laftel_clone/data/source/detail_anime_source.dart';
import 'package:laftel_clone/data/source/specific_anime_source.dart';
import 'package:laftel_clone/data/source/search_anime_source.dart';
import 'package:laftel_clone/domain/model/detail_anime_model.dart';
import 'package:laftel_clone/domain/model/search_anime_model.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';
import 'package:laftel_clone/domain/model/theme_anime_model.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final SpecificAnimeSource _quarterSource;
  final SearchAnimeSource _searchAnimeSource;
  final DetailAnimeSource _detailAnimeSource;

  const AnimeRepositoryImpl({
    required SpecificAnimeSource quarterSource,
    required SearchAnimeSource themeAnimeSource,
    required DetailAnimeSource detailAnimeSource,
  })  : _quarterSource = quarterSource,
        _searchAnimeSource = themeAnimeSource,
        _detailAnimeSource = detailAnimeSource;

  @override
  Future<List<SimpleAnimeModel>> getQuarterAnime(
      String year, String quarter) async {
    final data = await _quarterSource.getQuarterAnimeList(year, quarter);

    return data.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<ThemeAnimeModel>> getThemeAnimeModel() async {
    final data = await _quarterSource.getThemeAnimeList();

    return data.map((e) => e.toModel()).toList();
  }

  @override
  Future<Result<DetailAnimeModel>> getDetailAnimeModel(
      {required int id}) async {
    try {
      final data = await _detailAnimeSource.getSource(id);

      final json = DetailAnimeDto.fromJson(data);

      return Result.success(json.toModel());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<SearchAnimeModel> getSearchAnimeList() async {
    final data = await _searchAnimeSource.getSearchAnimeList();

    return _toSimpleAnimeModel(map: data);
  }
  
  @override
  Future<SearchAnimeModel> getNextAnimeList({required String next}) async {
    final data = await _searchAnimeSource.getNextAnimeList(next: next);

    return _toSimpleAnimeModel(map: data);
  }

  SearchAnimeModel _toSimpleAnimeModel({required Map<String,dynamic> map}) {
    final List<dynamic> data = map['results'];

    return SearchAnimeModel(
      count: map['count'] ?? 0,
      model: data.map((e) => SimpleAnimeDto.fromJson(e).toModel()).toList(),
      next: map['next'],
    );
  }
}
