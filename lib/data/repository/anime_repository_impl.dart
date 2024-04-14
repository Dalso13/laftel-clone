import 'package:laftel_clone/core/result.dart';
import 'package:laftel_clone/data/dto/detail_anime_dto.dart';
import 'package:laftel_clone/data/dto/episode_dto.dart';
import 'package:laftel_clone/data/dto/simple_anime_dto.dart';
import 'package:laftel_clone/data/mapper/detail_anime_mapper.dart';
import 'package:laftel_clone/data/mapper/episode_anime_mapper.dart';
import 'package:laftel_clone/data/mapper/quarter_anime_mapper.dart';
import 'package:laftel_clone/data/mapper/theme_anime_mapper.dart';
import 'package:laftel_clone/data/source/detail_anime_source.dart';
import 'package:laftel_clone/data/source/search_anime_source.dart';
import 'package:laftel_clone/data/source/specific_anime_source.dart';
import 'package:laftel_clone/data/source/finder_anime_source.dart';
import 'package:laftel_clone/domain/model/detail_anime_model.dart';
import 'package:laftel_clone/domain/model/search_anime_model.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';
import 'package:laftel_clone/domain/model/theme_anime_model.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';

import '../../domain/model/episode_anime_model.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final SpecificAnimeSource _quarterSource;
  final FinderAnimeSource _finderAnimeSource;
  final SearchAnimeSource _searchAnimeSource;
  final DetailAnimeSource _detailAnimeSource;

  const AnimeRepositoryImpl({
    required SpecificAnimeSource quarterSource,
    required FinderAnimeSource themeAnimeSource,
    required DetailAnimeSource detailAnimeSource,
    required SearchAnimeSource searchAnimeSource,
  })  : _quarterSource = quarterSource,
        _finderAnimeSource = themeAnimeSource,
        _detailAnimeSource = detailAnimeSource,
        _searchAnimeSource = searchAnimeSource;

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
      final data = await _detailAnimeSource.getAnimeInfo(id);
      final series = data['series_id'] == null ? {} : await _detailAnimeSource.getSeries(data['series_id']);


      if (data.isEmpty) {
        return const Result.error();
      }


      final json = DetailAnimeDto.fromJson(data);

      final List<dynamic> seriesItem = series.isEmpty ? [] : series['results'] ?? [];

      return Result.success(json.toModel(seriesItem: seriesItem));

    } catch (e) {
      return const Result.error();
    }
  }


  @override
  Future<SearchAnimeModel> getFinderAnimeList() async {
    final data = await _finderAnimeSource.getFinderAnimeList();

    return _toSimpleAnimeModel(map: data);
  }
  
  @override
  Future<SearchAnimeModel> getFinderNextAnimeList({required String next}) async {
    final data = await _finderAnimeSource.getNextAnimeList(next: next);

    return _toSimpleAnimeModel(map: data);
  }

  @override
  Future<SearchAnimeModel> getSearchAnimeList({required String query}) async{
    final data = await _searchAnimeSource.getSearchAnimeList(query: query);

    return _toSimpleAnimeModel(map: data);
  }

  @override
  Future<SearchAnimeModel> getSearchNextAnimeList({required String next}) async{
    final data = await _searchAnimeSource.getNextAnimeList(next: next);

    return _toSimpleAnimeModel(map: data);
  }

  @override
  Future<List<EpisodeAnimeModel>> getEpisodeAnimeModel({required int id}) async {

    final data = await _detailAnimeSource.getEpisode(id);
    if(data.isEmpty)return [];
    final dto = EpisodeDto.fromJson(data);
    final result = dto.results;
    if(result == null)return [];
    return result.map((e) => e.toModel()).toList();
  }
  SearchAnimeModel _toSimpleAnimeModel({required Map<String,dynamic> map}) {
    final List<dynamic> data = map['results'];

    return SearchAnimeModel(
      count: map['count'] ?? 0,
      model: data.map((e) => SimpleAnimeDto.fromJson(e).toModel()).toList(),
      next: map['next'] ?? '',
    );
  }



}
