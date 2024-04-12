class EpisodeDto {
  int? count;
  String? next;
  String? previous;
  List<EpisodeResults>? results;

  EpisodeDto({this.count, this.next, this.previous, this.results});

  EpisodeDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <EpisodeResults>[];
      json['results'].forEach((v) {
        results!.add(EpisodeResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] =
          results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EpisodeResults {
  int? id;
  String? title;
  String? subject;
  String? description;
  String? episodeNum;
  int? episodeOrder;
  String? thumbnailPath;
  bool? hasPreview;
  List<dynamic>? accessInfoList;
  String? runningTime;
  dynamic progressbar;
  String? itemExpireDatetime;
  bool? inAppDownload;
  bool? isAvod;
  bool? isFree;
  bool? isViewing;
  List<dynamic>? products;
  List<dynamic>? episodeProducts;
  String? publishedDatetime;
  Rating? rating;
  dynamic accessType;
  bool? isAvailable;

  EpisodeResults(
      {this.id,
        this.title,
        this.subject,
        this.description,
        this.episodeNum,
        this.episodeOrder,
        this.thumbnailPath,
        this.hasPreview,
        this.accessInfoList,
        this.runningTime,
        this.progressbar,
        this.itemExpireDatetime,
        this.inAppDownload,
        this.isAvod,
        this.isFree,
        this.isViewing,
        this.products,
        this.episodeProducts,
        this.publishedDatetime,
        this.rating,
        this.accessType,
        this.isAvailable});

  EpisodeResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subject = json['subject'];
    description = json['description'];
    episodeNum = json['episode_num'];
    episodeOrder = json['episode_order'];
    thumbnailPath = json['thumbnail_path'];
    hasPreview = json['has_preview'];
    accessInfoList = json['access_type'];
    runningTime = json['running_time'];
    progressbar = json['progressbar'];
    itemExpireDatetime = json['item_expire_datetime'];
    inAppDownload = json['in_app_download'];
    isAvod = json['is_avod'];
    isFree = json['is_free'];
    isViewing = json['is_viewing'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(v);
      });
    }
    if (json['episode_products'] != null) {
      episodeProducts = [];
      json['episode_products'].forEach((v) {
        episodeProducts!.add(v);
      });
    }
    publishedDatetime = json['published_datetime'];
    rating =
    json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    accessType = json['access_type'];
    isAvailable = json['is_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subject'] = subject;
    data['description'] = description;
    data['episode_num'] = episodeNum;
    data['episode_order'] = episodeOrder;
    data['thumbnail_path'] = thumbnailPath;
    data['has_preview'] = hasPreview;
    if (accessInfoList != null) {
      data['access_info_list'] =
          accessInfoList!.map((v) => v.toJson()).toList();
    }
    data['running_time'] = runningTime;
    data['progressbar'] = progressbar;
    data['item_expire_datetime'] = itemExpireDatetime;
    data['in_app_download'] = inAppDownload;
    data['is_avod'] = isAvod;
    data['is_free'] = isFree;
    data['is_viewing'] = isViewing;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (episodeProducts != null) {
      data['episode_products'] =
          episodeProducts!.map((v) => v.toJson()).toList();
    }
    data['published_datetime'] = publishedDatetime;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['access_type'] = accessType;
    data['is_available'] = isAvailable;
    return data;
  }
}

class Rating {
  int? rating;
  String? classificationNumber;
  String? broadcastChannelName;
  dynamic broadcastDate;
  List<dynamic>? ratingComponents;

  Rating(
      {this.rating,
        this.classificationNumber,
        this.broadcastChannelName,
        this.broadcastDate,
        this.ratingComponents});

  Rating.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    classificationNumber = json['classification_number'];
    broadcastChannelName = json['broadcast_channel_name'];
    broadcastDate = json['broadcast_date'];
    if (json['rating_components'] != null) {
      ratingComponents = <Null>[];
      json['rating_components'].forEach((v) {
        ratingComponents!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['classification_number'] = classificationNumber;
    data['broadcast_channel_name'] = broadcastChannelName;
    data['broadcast_date'] = broadcastDate;
    if (ratingComponents != null) {
      data['rating_components'] = ratingComponents;
    }
    return data;
  }
}
