/*
class DetailAnimeDto {
  int? id;
  String? created;
  String? modified;
  String? name;
  String? type;
  String? img;
  String? content;
  List<dynamic>? author;
  List<dynamic>? illustrator;
  List<dynamic>? awards;
  String? contentRating;
  bool? isEnding;
  List<dynamic>? mainTag;
  bool? viewable;
  Map<String,dynamic>? animationInfo;
  bool? isAdult;
  Map<String,dynamic>? resolution;
  Map<String,dynamic>? metaInfo;
  List<dynamic>? authorItem;
  List<dynamic>? mediamixItem;
  List<dynamic>? relatedItem;
  List<dynamic>? seriesItem;
  double? avgRating;
  Map<String,dynamic>? comicsInfo;
  Map<String,dynamic>? lightnovelInfo;
  Map<String,dynamic>? webtoonInfo;

//<editor-fold desc="Data Methods">
  DetailAnimeDto({
    this.id,
    this.created,
    this.modified,
    this.name,
    this.type,
    this.img,
    this.content,
    this.author,
    this.illustrator,
    this.awards,
    this.contentRating,
    this.isEnding,
    this.mainTag,
    this.viewable,
    this.animationInfo,
    this.isAdult,
    this.resolution,
    this.metaInfo,
    this.authorItem,
    this.mediamixItem,
    this.relatedItem,
    this.seriesItem,
    this.avgRating,
    this.comicsInfo,
    this.lightnovelInfo,
    this.webtoonInfo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailAnimeDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          created == other.created &&
          modified == other.modified &&
          name == other.name &&
          type == other.type &&
          img == other.img &&
          content == other.content &&
          author == other.author &&
          illustrator == other.illustrator &&
          awards == other.awards &&
          contentRating == other.contentRating &&
          isEnding == other.isEnding &&
          mainTag == other.mainTag &&
          viewable == other.viewable &&
          animationInfo == other.animationInfo &&
          isAdult == other.isAdult &&
          resolution == other.resolution &&
          metaInfo == other.metaInfo &&
          authorItem == other.authorItem &&
          mediamixItem == other.mediamixItem &&
          relatedItem == other.relatedItem &&
          seriesItem == other.seriesItem &&
          avgRating == other.avgRating &&
          comicsInfo == other.comicsInfo &&
          lightnovelInfo == other.lightnovelInfo &&
          webtoonInfo == other.webtoonInfo);

  @override
  int get hashCode =>
      id.hashCode ^
      created.hashCode ^
      modified.hashCode ^
      name.hashCode ^
      type.hashCode ^
      img.hashCode ^
      content.hashCode ^
      author.hashCode ^
      illustrator.hashCode ^
      awards.hashCode ^
      contentRating.hashCode ^
      isEnding.hashCode ^
      mainTag.hashCode ^
      viewable.hashCode ^
      animationInfo.hashCode ^
      isAdult.hashCode ^
      resolution.hashCode ^
      metaInfo.hashCode ^
      authorItem.hashCode ^
      mediamixItem.hashCode ^
      relatedItem.hashCode ^
      seriesItem.hashCode ^
      avgRating.hashCode ^
      comicsInfo.hashCode ^
      lightnovelInfo.hashCode ^
      webtoonInfo.hashCode;

  @override
  String toString() {
    return 'DetailAnimeDto{ id: $id, created: $created, modified: $modified, name: $name, type: $type, img: $img, content: $content, author: $author, illustrator: $illustrator, awards: $awards, contentRating: $contentRating, isEnding: $isEnding, mainTag: $mainTag, viewable: $viewable, animationInfo: $animationInfo, isAdult: $isAdult, resolution: $resolution, metaInfo: $metaInfo, authorItem: $authorItem, mediamixItem: $mediamixItem, relatedItem: $relatedItem, seriesItem: $seriesItem, avgRating: $avgRating, comicsInfo: $comicsInfo, lightnovelInfo: $lightnovelInfo, webtoonInfo: $webtoonInfo,}';
  }

  DetailAnimeDto copyWith({
    int? id,
    String? created,
    String? modified,
    String? name,
    String? type,
    String? img,
    String? content,
    List<dynamic>? author,
    List<dynamic>? illustrator,
    List<dynamic>? awards,
    String? contentRating,
    bool? isEnding,
    List<dynamic>? mainTag,
    bool? viewable,
    Map<String, dynamic>? animationInfo,
    bool? isAdult,
    Map<String, dynamic>? resolution,
    Map<String, dynamic>? metaInfo,
    List<dynamic>? authorItem,
    List<dynamic>? mediamixItem,
    List<dynamic>? relatedItem,
    List<dynamic>? seriesItem,
    double? avgRating,
    Map<String, dynamic>? comicsInfo,
    Map<String, dynamic>? lightnovelInfo,
    Map<String, dynamic>? webtoonInfo,
  }) {
    return DetailAnimeDto(
      id: id ?? this.id,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      name: name ?? this.name,
      type: type ?? this.type,
      img: img ?? this.img,
      content: content ?? this.content,
      author: author ?? this.author,
      illustrator: illustrator ?? this.illustrator,
      awards: awards ?? this.awards,
      contentRating: contentRating ?? this.contentRating,
      isEnding: isEnding ?? this.isEnding,
      mainTag: mainTag ?? this.mainTag,
      viewable: viewable ?? this.viewable,
      animationInfo: animationInfo ?? this.animationInfo,
      isAdult: isAdult ?? this.isAdult,
      resolution: resolution ?? this.resolution,
      metaInfo: metaInfo ?? this.metaInfo,
      authorItem: authorItem ?? this.authorItem,
      mediamixItem: mediamixItem ?? this.mediamixItem,
      relatedItem: relatedItem ?? this.relatedItem,
      seriesItem: seriesItem ?? this.seriesItem,
      avgRating: avgRating ?? this.avgRating,
      comicsInfo: comicsInfo ?? this.comicsInfo,
      lightnovelInfo: lightnovelInfo ?? this.lightnovelInfo,
      webtoonInfo: webtoonInfo ?? this.webtoonInfo,
    );
  }

  factory DetailAnimeDto.fromJson(Map<String, dynamic> map) {
    return DetailAnimeDto(
      id: map['id'],
      created: map['created'],
      modified: map['modified'],
      name: map['name'],
      type: map['type'],
      img: map['img'],
      content: map['content'],
      author: map['author'],
      illustrator: map['illustrator'],
      awards: map['awards'],
      contentRating: map['content_rating'],
      isEnding: map['is_ending'],
      mainTag: map['main_tag'],
      viewable: map['viewable'],
      animationInfo: map['animation_info'],
      isAdult: map['is_adult'],
      resolution: map['resolution'],
      metaInfo: map['meta_info'],
      authorItem: map['author_item'],
      mediamixItem: map['mediamix_item'],
      relatedItem: map['related_item'],
      seriesItem: map['series_item'],
      avgRating: map['avg_rating'],
      comicsInfo: map['comics_info'],
      lightnovelInfo: map['lightnovel_info'],
      webtoonInfo: map['webtoon_info'],
    );
  }

//</editor-fold>
}*/

class DetailAnimeDto {
  int? id;
  String? name;
  dynamic notice;
  String? img;
  List<Images>? images;
  dynamic highlightVideo;
  String? content;
  List<String>? awards;
  String? medium;
  String? contentRating;
  bool? isEnding;
  String? production;
  String? airYearQuarter;
  bool? isDubbed;
  bool? isLaftelOnly;
  bool? isLaftelOriginal;
  bool? isUncensored;
  String? distributedAirTime;
  bool? isAdult;
  String? avodStatus;
  bool? isAvod;
  bool? isSvod;
  bool? isViewing;
  List<String>? genres;
  int? cntShortReview;
  double? avgRating;
  List<String>? tags;
  String? expireDatetime;
  bool? isEpisodeExisted;
  int? seriesId;
  List<String>? author;
  List<String>? illustrator;
  String? copyright;
  Map<String,dynamic>? rating;
  bool? isWish;
  bool? isHate;

  DetailAnimeDto(
      {this.id,
        this.name,
        this.notice,
        this.img,
        this.images,
        this.highlightVideo,
        this.content,
        this.awards,
        this.medium,
        this.contentRating,
        this.isEnding,
        this.production,
        this.airYearQuarter,
        this.isDubbed,
        this.isLaftelOnly,
        this.isLaftelOriginal,
        this.isUncensored,
        this.distributedAirTime,
        this.isAdult,
        this.avodStatus,
        this.isAvod,
        this.isSvod,
        this.isViewing,
        this.genres,
        this.cntShortReview,
        this.avgRating,
        this.tags,
        this.expireDatetime,
        this.isEpisodeExisted,
        this.seriesId,
        this.author,
        this.illustrator,
        this.copyright,
        this.rating,
        this.isWish,
        this.isHate});

  DetailAnimeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    notice = json['notice'];
    img = json['img'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    highlightVideo = json['highlight_video'];
    content = json['content'];
    awards = json['awards'].cast<String>();
    medium = json['medium'];
    contentRating = json['content_rating'];
    isEnding = json['is_ending'];
    production = json['production'];
    airYearQuarter = json['air_year_quarter'];
    isDubbed = json['is_dubbed'];
    isLaftelOnly = json['is_laftel_only'];
    isLaftelOriginal = json['is_laftel_original'];
    isUncensored = json['is_uncensored'];
    distributedAirTime = json['distributed_air_time'];
    isAdult = json['is_adult'];
    avodStatus = json['avod_status'];
    isAvod = json['is_avod'];
    isSvod = json['is_svod'];
    isViewing = json['is_viewing'];
    genres = json['genres'].cast<String>();
    cntShortReview = json['cnt_short_review'];
    avgRating = json['avg_rating'];
    tags = json['tags'].cast<String>();
    expireDatetime = json['expire_datetime'];
    isEpisodeExisted = json['is_episode_existed'];
    seriesId = json['series_id'];
    author = json['author'].cast<String>();
    illustrator = json['illustrator'].cast<String>();
    copyright = json['copyright'];
    rating =
    json['rating'];
    isWish = json['is_wish'];
    isHate = json['is_hate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['notice'] = notice;
    data['img'] = img;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['highlight_video'] = highlightVideo;
    data['content'] = content;
    data['awards'] = awards;
    data['medium'] = medium;
    data['content_rating'] = contentRating;
    data['is_ending'] = isEnding;
    data['production'] = production;
    data['air_year_quarter'] = airYearQuarter;
    data['is_dubbed'] = isDubbed;
    data['is_laftel_only'] = isLaftelOnly;
    data['is_laftel_original'] = isLaftelOriginal;
    data['is_uncensored'] = isUncensored;
    data['distributed_air_time'] = distributedAirTime;
    data['is_adult'] = isAdult;
    data['avod_status'] = avodStatus;
    data['is_avod'] = isAvod;
    data['is_svod'] = isSvod;
    data['is_viewing'] = isViewing;
    data['genres'] = genres;
    data['cnt_short_review'] = cntShortReview;
    data['avg_rating'] = avgRating;
    data['tags'] = tags;
    data['expire_datetime'] = expireDatetime;
    data['is_episode_existed'] = isEpisodeExisted;
    data['series_id'] = seriesId;
    data['author'] = author;
    data['illustrator'] = illustrator;
    data['copyright'] = copyright;
    if (rating != null) {
      data['rating'] = rating;
    }
    data['is_wish'] = isWish;
    data['is_hate'] = isHate;
    return data;
  }
}

class Images {
  String? optionName;
  String? imgUrl;
  String? cropRatio;

  Images({this.optionName, this.imgUrl, this.cropRatio});

  Images.fromJson(Map<String, dynamic> json) {
    optionName = json['option_name'];
    imgUrl = json['img_url'];
    cropRatio = json['crop_ratio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['option_name'] = optionName;
    data['img_url'] = imgUrl;
    data['crop_ratio'] = cropRatio;
    return data;
  }
}