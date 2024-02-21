import 'package:laftel_clone/data/dto/theme_anime_dto.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';
import 'package:laftel_clone/domain/model/theme_anime_model.dart';

extension ThemeAnimeMapper on ThemeAnimeDto {
  ThemeAnimeModel toModel() {
    return ThemeAnimeModel(
        title: title ?? '',
        themeId: id ?? -1,
        themeItemList: _a(),
    );
  }

  List<SimpleAnimeModel> _a() {
    if (themeItemList == null) return [];
    return themeItemList!.where((element) => element.item != null).map((e) {
      return e.item!._toModel();
    }).toList();
  }
}

extension ThemeitemListMapper on ThemeItem {
  SimpleAnimeModel _toModel() {
    return SimpleAnimeModel(
      id: id ?? -1,
      name: name ?? '',
      img: imgUrl ?? '',
      genres: genreTagList ?? [],
      isViewing: isViewable ?? false,
      isUncensored: false,
      isLaftelOnly: false,
      isExpired: false,
      isEpisodeExisted: false,
      isDubbed: false,
      isAvod: false,
      distributedAirTime: '',
    );
  }
}