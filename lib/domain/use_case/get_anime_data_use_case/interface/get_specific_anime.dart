import '../../../model/simple_anime_model.dart';
import '../../../model/theme_anime_model.dart';

abstract interface class GetSpecificAnime {
  Future<List<SimpleAnimeModel>> getQuarter(String year, String quarter);
  Future<List<ThemeAnimeModel>> getTheme();
}