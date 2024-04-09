class EpisodeDto {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  EpisodeDto({this.count, this.next, this.previous, this.results});

  EpisodeDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
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

  Results(
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

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subject = json['subject'];
    description = json['description'];
    episodeNum = json['episode_num'];
    episodeOrder = json['episode_order'];
    thumbnailPath = json['thumbnail_path'];
    hasPreview = json['has_preview'];
    if (json['access_info_list'] != null) {
      accessInfoList = <Null>[];
      json['access_info_list'].forEach((v) {
        accessInfoList!.add(v);
      });
    }
    runningTime = json['running_time'];
    progressbar = json['progressbar'];
    itemExpireDatetime = json['item_expire_datetime'];
    inAppDownload = json['in_app_download'];
    isAvod = json['is_avod'];
    isFree = json['is_free'];
    isViewing = json['is_viewing'];
    if (json['products'] != null) {
      products = <Null>[];
      json['products'].forEach((v) {
        products!.add(v);
      });
    }
    if (json['episode_products'] != null) {
      episodeProducts = <Null>[];
      json['episode_products'].forEach((v) {
        episodeProducts!.add(v);
      });
    }
    publishedDatetime = json['published_datetime'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    accessType = json['access_type'];
    isAvailable = json['is_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subject'] = this.subject;
    data['description'] = this.description;
    data['episode_num'] = this.episodeNum;
    data['episode_order'] = this.episodeOrder;
    data['thumbnail_path'] = this.thumbnailPath;
    data['has_preview'] = this.hasPreview;
    if (this.accessInfoList != null) {
      data['access_info_list'] =
          this.accessInfoList!.map((v) => v.toJson()).toList();
    }
    data['running_time'] = this.runningTime;
    data['progressbar'] = this.progressbar;
    data['item_expire_datetime'] = this.itemExpireDatetime;
    data['in_app_download'] = this.inAppDownload;
    data['is_avod'] = this.isAvod;
    data['is_free'] = this.isFree;
    data['is_viewing'] = this.isViewing;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.episodeProducts != null) {
      data['episode_products'] =
          this.episodeProducts!.map((v) => v.toJson()).toList();
    }
    data['published_datetime'] = this.publishedDatetime;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    data['access_type'] = this.accessType;
    data['is_available'] = this.isAvailable;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['classification_number'] = this.classificationNumber;
    data['broadcast_channel_name'] = this.broadcastChannelName;
    data['broadcast_date'] = this.broadcastDate;
    if (this.ratingComponents != null) {
      data['rating_components'] =
          this.ratingComponents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}