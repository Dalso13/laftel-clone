class ThemeAnimeDto {
  int? id;
  String? title;
  String? content;
  List<ThemeItemList>? themeItemList;

  ThemeAnimeDto({this.id, this.title, this.content, this.themeItemList});

  ThemeAnimeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    if (json['theme_item_list'] != null) {
      themeItemList = <ThemeItemList>[];
      json['theme_item_list'].forEach((v) {
        themeItemList!.add(ThemeItemList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    if (themeItemList != null) {
      data['theme_item_list'] =
          themeItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThemeItemList {
  int? id;
  String? ment;
  ThemeItem? item;

  ThemeItemList({this.id, this.ment, this.item});

  ThemeItemList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ment = json['ment'];
    item = json['item'] != null ? ThemeItem.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ment'] = ment;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}

class ThemeItem {
  int? id;
  String? type;
  String? name;
  String? imgUrl;
  bool? isAdult;
  bool? isViewable;
  double? avgRating;
  List<String>? genreTagList;
  bool? isEnding;
  String? contentRating;
  String? content;

  ThemeItem(
      {this.id,
        this.type,
        this.name,
        this.imgUrl,
        this.isAdult,
        this.isViewable,
        this.avgRating,
        this.genreTagList,
        this.isEnding,
        this.contentRating,
        this.content});

  ThemeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    imgUrl = json['img_url'];
    isAdult = json['is_adult'];
    isViewable = json['is_viewable'];
    avgRating = json['avg_rating'];
    genreTagList = json['genre_tag_list'].cast<String>();
    isEnding = json['is_ending'];
    contentRating = json['content_rating'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['img_url'] = imgUrl;
    data['is_adult'] = isAdult;
    data['is_viewable'] = isViewable;
    data['avg_rating'] = avgRating;
    data['genre_tag_list'] = genreTagList;
    data['is_ending'] = isEnding;
    data['content_rating'] = contentRating;
    data['content'] = content;
    return data;
  }
}