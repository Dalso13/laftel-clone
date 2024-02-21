import 'package:get_it/get_it.dart';
import 'package:laftel_clone/data/repository/anime_repository_impl.dart';
import 'package:laftel_clone/data/source/quarter_anime_source.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/impl/get_quarter_anime_impl.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_quarter_anime.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<QuarterAnimeSource>(QuarterAnimeSource());

  getIt.registerSingleton<AnimeRepository>(AnimeRepositoryImpl(quarterSource: getIt<QuarterAnimeSource>()));

  getIt.registerSingleton<GetQuarterAnime>(GetQuarterAnimeImpl(repository: getIt<AnimeRepository>()));

  getIt.registerFactory<MainViewModel>(
    () => MainViewModel(
      getQuarterAnime: getIt<GetQuarterAnime>(),
    ),
  );
}
