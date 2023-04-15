class Banners {
  String? bannerId;
  String? bannerTitle;
  String? bannerTitleAr;
  String? bannerSubtitile;
  String? bannerSubtitileAr;
  String? bannerImage;
  String? bannerDetailes;
  String? bannerDatetime;

  Banners(
      {this.bannerId,
      this.bannerTitle,
      this.bannerTitleAr,
      this.bannerSubtitile,
      this.bannerSubtitileAr,
      this.bannerImage,
      this.bannerDetailes,
      this.bannerDatetime});

  Banners.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerTitle = json['banner_title'];
    bannerTitleAr = json['banner_title_ar'];
    bannerSubtitile = json['banner_subtitile'];
    bannerSubtitileAr = json['banner_subtitile_ar'];
    bannerImage = json['banner_image'];
    bannerDetailes = json['banner_detailes'];
    bannerDatetime = json['banner_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_id'] = this.bannerId;
    data['banner_title'] = this.bannerTitle;
    data['banner_title_ar'] = this.bannerTitleAr;
    data['banner_subtitile'] = this.bannerSubtitile;
    data['banner_subtitile_ar'] = this.bannerSubtitileAr;
    data['banner_image'] = this.bannerImage;
    data['banner_detailes'] = this.bannerDetailes;
    data['banner_datetime'] = this.bannerDatetime;
    return data;
  }
}
