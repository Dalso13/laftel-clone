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
        images!.add(new Images.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['cropped_img'] = this.croppedImg;
    data['home_img'] = this.homeImg;
    data['home_cropped_img'] = this.homeCroppedImg;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['content_rating'] = this.contentRating;
    data['rating'] = this.rating;
    data['is_adult'] = this.isAdult;
    data['genres'] = this.genres;
    data['medium'] = this.medium;
    data['distributed_air_time'] = this.distributedAirTime;
    data['is_laftel_only'] = this.isLaftelOnly;
    data['is_uncensored'] = this.isUncensored;
    data['is_dubbed'] = this.isDubbed;
    data['is_avod'] = this.isAvod;
    data['avod_status'] = this.avodStatus;
    data['is_viewing'] = this.isViewing;
    data['latest_episode_created'] = this.latestEpisodeCreated;
    data['latest_published_datetime'] = this.latestPublishedDatetime;
    data['is_episode_existed'] = this.isEpisodeExisted;
    data['is_expired'] = this.isExpired;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crop_ratio'] = this.cropRatio;
    data['img_url'] = this.imgUrl;
    data['option_name'] = this.optionName;
    return data;
  }
}
