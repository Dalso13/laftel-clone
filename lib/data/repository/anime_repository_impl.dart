import 'package:laftel_clone/data/mapper/quarter_anime_mapper.dart';
import 'package:laftel_clone/data/source/quarter_anime_source.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final QuarterAnimeSource _quarterSource;

  const AnimeRepositoryImpl({
    required QuarterAnimeSource quarterSource,
  }) : _quarterSource = quarterSource;

  @override
  Future<List<SimpleAnimeModel>> getQuarterAnime(String year, String quarter) async {
    final data = await _quarterSource.getSource(year, quarter);

    return data.map((e) => e.toModel()).toList();
  }


}