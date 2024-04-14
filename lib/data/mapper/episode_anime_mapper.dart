import 'package:intl/intl.dart';
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
      itemExpireDatetime: itemExpireDatetime != null ? DateTime.parse('itemExpireDatetime') : DateTime.now(),
      runningTime: runningTime != null ? _getRunningTime(runningTime!) : const Duration(microseconds: 0),
      isAvod: isAvod ?? false,
      isFree: isFree ?? false,
      isViewing: isViewing ?? false,
      isAvailable: isAvailable ?? false,
    );
  }

  Duration _getRunningTime(String time) {
    if(time.substring(0,time.indexOf(":")).length == 1){
      time = '0$time';
    }
    final ts = DateFormat('y-MM-dd').format(DateTime.now());
    final dt = DateTime.parse("$ts $time");
    return Duration(hours: dt.hour, minutes: dt.minute, seconds: dt.second);
  }
}
