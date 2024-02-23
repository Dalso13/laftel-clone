import 'package:get_it/get_it.dart';
import 'package:laftel_clone/data/repository/anime_repository_impl.dart';
import 'package:laftel_clone/data/source/detail_anime_source.dart';
import 'package:laftel_clone/data/source/quarter_anime_source.dart';
import 'package:laftel_clone/data/source/theme_anime_source.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/impl/get_detail_anime_impl.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/impl/get_quarter_anime_impl.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_detail_anime.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_quarter_anime.dart';
import 'package:laftel_clone/presentation/view_model/detail_anime_view_model.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<QuarterAnimeSource>(QuarterAnimeSource());
  getIt.registerSingleton<ThemeAnimeSource>(ThemeAnimeSource());
  getIt.registerSingleton<DetailAnimeSource>(DetailAnimeSource());

  getIt.registerSingleton<AnimeRepository>(
    AnimeRepositoryImpl(
      quarterSource: getIt<QuarterAnimeSource>(),
      themeAnimeSource: getIt<ThemeAnimeSource>(),
      detailAnimeSource: getIt<DetailAnimeSource>(),
    ),
  );

  getIt.registerSingleton<GetQuarterAnime>(
      GetQuarterAnimeImpl(repository: getIt<AnimeRepository>()));
  getIt.registerSingleton<GetDetailAnime>(
      GetDetailAnimeImpl(repository: getIt<AnimeRepository>()));

  getIt.registerFactory<MainViewModel>(
    () => MainViewModel(
      getQuarterAnime: getIt<GetQuarterAnime>(),
    ),
  );
  getIt.registerFactory<DetailAnimeViewModel>(
        () => DetailAnimeViewModel(
      getDetailAnime: getIt<GetDetailAnime>(),
    ),
  );
}
