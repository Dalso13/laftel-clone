import 'package:get_it/get_it.dart';
import 'package:laftel_clone/data/repository/anime_repository_impl.dart';
import 'package:laftel_clone/data/source/detail_anime_source.dart';
import 'package:laftel_clone/data/source/specific_anime_source.dart';
import 'package:laftel_clone/data/source/search_anime_source.dart';
import 'package:laftel_clone/domain/repository/anime_repository.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/impl/get_detail_anime_impl.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/impl/get_specific_anime_impl.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_detail_anime.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_search_anime.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_specific_anime.dart';
import 'package:laftel_clone/presentation/view_model/detail_anime_view_model.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';
import 'package:laftel_clone/presentation/view_model/search_view_model.dart';
import 'package:laftel_clone/presentation/view_model/storage_box_view_model.dart';

import '../domain/use_case/get_anime_data_use_case/impl/get_search_anime_impl.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<SpecificAnimeSource>(SpecificAnimeSource());
  getIt.registerSingleton<SearchAnimeSource>(SearchAnimeSource());
  getIt.registerSingleton<DetailAnimeSource>(DetailAnimeSource());

  getIt.registerSingleton<AnimeRepository>(
    AnimeRepositoryImpl(
      quarterSource: getIt<SpecificAnimeSource>(),
      themeAnimeSource: getIt<SearchAnimeSource>(),
      detailAnimeSource: getIt<DetailAnimeSource>(),
    ),
  );

  getIt.registerSingleton<GetSpecificAnime>(
      GetSpecificAnimeImpl(repository: getIt<AnimeRepository>()));
  getIt.registerSingleton<GetDetailAnime>(
      GetDetailAnimeImpl(repository: getIt<AnimeRepository>()));
  getIt.registerSingleton<GetSearchAnime>(
      GetSearchAnimeImpl(repository: getIt<AnimeRepository>()));

  getIt.registerFactory<MainViewModel>(
    () => MainViewModel(
      getQuarterAnime: getIt<GetSpecificAnime>(),
    ),
  );
  getIt.registerFactory<DetailAnimeViewModel>(
        () => DetailAnimeViewModel(
      getDetailAnime: getIt<GetDetailAnime>(),
    ),
  );
  getIt.registerFactory<StorageBoxViewModel>(
        () => StorageBoxViewModel(),
  );
  getIt.registerFactory<SearchViewModel>(
        () => SearchViewModel(getSearchAnime: getIt<GetSearchAnime>()),
  );
}
