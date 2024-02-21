import 'package:laftel_clone/data/dto/simple_anime_dto.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';

extension QuarterAnimeMapper on SimpleAnimeDto {
  SimpleAnimeModel toModel() {
    return SimpleAnimeModel(
      id: id ?? -1,
      name: name ?? '',
      img: img ?? '',
      distributedAirTime: distributedAirTime ?? '',
      genres: genres ?? [],
      isAvod: isAvod ?? false,
      isDubbed: isDubbed ?? false,
      isEpisodeExisted: isEpisodeExisted ?? false,
      isExpired: isExpired ?? false,
      isLaftelOnly: isLaftelOnly ?? false,
      isUncensored: isUncensored ?? false,
      isViewing: isUncensored ?? false
    );
  }
}