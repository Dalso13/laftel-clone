import 'package:laftel_clone/data/dto/detail_anime_dto.dart';
import 'package:laftel_clone/domain/model/animation_info_model.dart';
import 'package:laftel_clone/domain/model/detail_anime_model.dart';
import 'package:laftel_clone/domain/model/series_anime_model.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';
import 'package:laftel_clone/domain/model/tag_model.dart';


// old dto
/*
extension DetailAnimeMapper on DetailAnimeDto {
  DetailAnimeModel toModel() {
    return DetailAnimeModel(
        img: img ?? '',
        name: name ?? '',
        id: id ?? -1,
        content: content ?? '',
        type: type ?? '',
        contentRating: contentRating ?? '',
        isAdult: isAdult ?? false,
        viewable: viewable ?? false,
        isEnding: isEnding ?? false,
        avgRating: avgRating ?? 0.0,
        mainTag: _toTagModel(),
        animationInfo: _toInfoModel(animationInfo),
        author: _toAuthor(),
        seriesItem: _toAnimeModel(seriesItem)..sort((a,b) => a.id.compareTo(b.id)),
        relatedItem: _toAnimeModel(relatedItem),
    );
  }

  List<SimpleAnimeModel> _toAnimeModel(List<dynamic>? items) {
    if (items == null || items.isEmpty) return [];
    return items.map((e) {
      final info = _toInfoModel(e['animation_info']);
      return SimpleAnimeModel(
        id: e['id'] ?? -1,
        name: e['name'] ?? '',
        img: e['img'] ?? '',
        genres: [],
        distributedAirTime: '',
        isUncensored: info.isUncensored,
        isLaftelOnly: info.isLaftelOnly,
        isDubbed: info.isDubbed,
        isAvod: e['is_avod'] ?? false,
        isViewing: e['is_viewing'] ?? false,
        isEpisodeExisted: false,
        isExpired: e['is_expired'] ?? false,);
    }).toList();
  }

  List<String> _toAuthor() {
    if (author == null || author!.isEmpty) return [];
    return author!.map((e) {
      return (e['name'] ?? '') as String;
    }).toList();
  }

  List<TagModel> _toTagModel() {
    if (mainTag == null) {
      return [];
    } else {
      return mainTag!.map((e) =>
          TagModel(
            id: e['id'] ?? -1,
            name: e['name'] ?? '',
            type: e['type'] ?? '',
          )).toList();
    }
  }

  AnimationInfoModel _toInfoModel(Map<String, dynamic>? map) {
    if (map == null) {
      return const AnimationInfoModel(
        production: '',
        airYearQuarter: '',
        isDubbed: false,
        medium: '',
        isLaftelOnly: false,
        isLaftelOriginal: false,
        isUncensored: false);
    } else {
      return AnimationInfoModel(
        production: map['production'] == null
            ? ''
            : map['production']!['name'] ?? '',
        medium: map['medium'] ?? '',
        airYearQuarter: map['air_year_quarter'] ?? '',
        isDubbed: map['is_dubbed'] ?? false,
        isLaftelOnly: map['is_laftel_only'] ?? false,
        isLaftelOriginal: map['is_laftel_original'] ?? false,
        isUncensored: map['is_uncensored'] ?? false,
        season: map['season'] ?? '',
      );
    }
  }
}
*/


extension DetailAnimeMapper on DetailAnimeDto {
  DetailAnimeModel toModel({required List<dynamic> seriesItem}) {
    return DetailAnimeModel(id: id ?? 0,
        name: name ?? '',
        img: img ?? '',
        content: content ?? '',
        author: author ?? [],
        contentRating: contentRating ?? '',
        isAdult: isAdult ?? false,
        viewable: isViewing ?? false,
        isEnding: isEnding ?? false,
        avgRating: avgRating ?? 0,
        animationInfo:
        AnimationInfoModel(
            production: production ?? '',
            airYearQuarter: airYearQuarter ?? '',
            medium: medium ?? '',
            isDubbed: isDubbed ?? false,
            isLaftelOnly: isLaftelOnly ?? false,
            isLaftelOriginal: isLaftelOriginal ?? false,
            isUncensored: isUncensored ?? false),
        mainTag: tags ?? [],
        seriesId: seriesId ?? -1,
        seriesItem: seriesItem.map((e) => SeriesAnimeModel(id: e['id'] ?? -1, name: e['name'] ?? '')).toList()
    );
  }

}