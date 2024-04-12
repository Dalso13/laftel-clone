import 'package:laftel_clone/data/dto/episode_dto.dart';
import 'package:laftel_clone/domain/model/episode_anime_model.dart';

extension EpisodeAnimeMapper on EpisodeResults {
  EpisodeAnimeModel toModel() {
    return EpisodeAnimeModel(
      id: id ?? -1,
      episodeOrder: episodeOrder ?? -1,
      title: title ?? '',
      thumbnailPath: thumbnailPath ?? '',
      subject: subject ?? '',
      description: description ?? '',
      hasPreview: hasPreview ?? false,
      inAppDownload: inAppDownload ?? false,
      isAvod: isAvod ?? false,
      isFree: isFree ?? false,
      isViewing: isViewing ?? false,
      isAvailable: isAvailable ?? false,
    );
  }
}
