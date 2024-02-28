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
}