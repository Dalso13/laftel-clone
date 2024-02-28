class SimpleAnimeDto {
  int? id;
  String? name;
  String? img;
  String? croppedImg;
  String? homeImg;
  String? homeCroppedImg;
  List<Images>? images;
  String? contentRating;
  int? rating;
  bool? isAdult;
  List<String>? genres;
  String? medium;
  String? distributedAirTime;
  bool? isLaftelOnly;
  bool? isUncensored;
  bool? isDubbed;
  bool? isAvod;
  String? avodStatus;
  bool? isViewing;
  String? latestEpisodeCreated;
  String? latestPublishedDatetime;
  bool? isEpisodeExisted;
  bool? isExpired;

  SimpleAnimeDto(
      {this.id,
        this.name,
        this.img,
        this.croppedImg,
        this.homeImg,
        this.homeCroppedImg,
        this.images,
        this.contentRating,
        this.rating,
        this.isAdult,
        this.genres,
        this.medium,
        this.distributedAirTime,
        this.isLaftelOnly,
        this.isUncensored,
        this.isDubbed,
        this.isAvod,
        this.avodStatus,
        this.isViewing,
        this.latestEpisodeCreated,
        this.latestPublishedDatetime,
        this.isEpisodeExisted,
        this.isExpired});

  SimpleAnimeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    croppedImg = json['cropped_img'];
    homeImg = json['home_img'];
    homeCroppedImg = json['home_cropped_img'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    contentRating = json['content_rating'];
    rating = json['rating'];
    isAdult = json['is_adult'];
    genres = json['genres'].cast<String>();
    medium = json['medium'];
    distributedAirTime = json['distributed_air_time'];
    isLaftelOnly = json['is_laftel_only'];
    isUncensored = json['is_uncensored'];
    isDubbed = json['is_dubbed'];
    isAvod = json['is_avod'];
    avodStatus = json['avod_status'];
    isViewing = json['is_viewing'];
    latestEpisodeCreated = json['latest_episode_created'];
    latestPublishedDatetime = json['latest_published_datetime'];
    isEpisodeExisted = json['is_episode_existed'];
    isExpired = json['is_expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    data['cropped_img'] = croppedImg;
    data['home_img'] = homeImg;
    data['home_cropped_img'] = homeCroppedImg;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['content_rating'] = contentRating;
    data['rating'] = rating;
    data['is_adult'] = isAdult;
    data['genres'] = genres;
    data['medium'] = medium;
    data['distributed_air_time'] = distributedAirTime;
    data['is_laftel_only'] = isLaftelOnly;
    data['is_uncensored'] = isUncensored;
    data['is_dubbed'] = isDubbed;
    data['is_avod'] = isAvod;
    data['avod_status'] = avodStatus;
    data['is_viewing'] = isViewing;
    data['latest_episode_created'] = latestEpisodeCreated;
    data['latest_published_datetime'] = latestPublishedDatetime;
    data['is_episode_existed'] = isEpisodeExisted;
    data['is_expired'] = isExpired;
    return data;
  }
}

class Images {
  String? cropRatio;
  String? imgUrl;
  String? optionName;

  Images({this.cropRatio, this.imgUrl, this.optionName});

  Images.fromJson(Map<String, dynamic> json) {
    cropRatio = json['crop_ratio'];
    imgUrl = json['img_url'];
    optionName = json['option_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['crop_ratio'] = cropRatio;
    data['img_url'] = imgUrl;
    data['option_name'] = optionName;
    return data;
  }
}
