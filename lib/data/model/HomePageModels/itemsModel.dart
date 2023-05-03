class Products {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsImage2;
  String? itemsImage3;
  String? itemsImage4;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsRate;
  String? itemsSize;
  String? itemsSize2;
  String? itemsSize3;
  String? itemsSize4;
  String? itemsDeliveryRefund;
  String? itemsSizeGuide;
  String? isNewTrend;
  String? itemsIsNew;
  String? itemsColor;
  String? itemsColor2;
  String? itemsColor3;
  String? itemsColor4;
  String? itemsDate;
  String? itemsCat;
  String? itemsBrand;
  String? itemsCatDetailes;
  String? itemsBrandAr;
  String? itemsCatDetailesAr;
  String? itemsMainPW;
  String? itemsMainPWAr;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDatetime;
  String? favourite;
  String? recent;

  Products(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsImage2,
      this.itemsImage3,
      this.itemsImage4,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsRate,
      this.itemsSize,
      this.itemsSize2,
      this.itemsSize3,
      this.itemsSize4,
      this.itemsDeliveryRefund,
      this.itemsSizeGuide,
      this.isNewTrend,
      this.itemsColor,
      this.itemsColor2,
      this.itemsColor3,
      this.itemsColor4,
      this.itemsDate,
      this.itemsIsNew,
      this.itemsCat,
      this.itemsBrand,
      this.itemsCatDetailes,
      this.itemsBrandAr,
      this.itemsCatDetailesAr,
      this.itemsMainPW,
      this.itemsMainPWAr,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesDatetime,
      this.favourite,
      this.recent});

  Products.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsImage2 = json['items_image_2'];
    itemsImage3 = json['items_image_3'];
    itemsImage4 = json['items_image_4'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsRate = json['items_rate'];
    itemsSize = json['items_Size'];
    itemsSize2 = json['items_Size2'];
    itemsSize3 = json['items_Size3'];
    itemsSize4 = json['items_Size4'];
    itemsColor = json['items_Color'];
    itemsColor2 = json['items_Color2'];
    itemsColor3 = json['items_Color3'];
    itemsColor4 = json['items_Color4'];
    itemsDeliveryRefund = json['items_delivery_refund'];
    itemsSizeGuide = json['items_size_guide'];
    isNewTrend = json['isNewTrend'];
    itemsIsNew = json['items_isNew'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsBrand = json['items_brand'];
    itemsCatDetailes = json['items_catDetailes'];
    itemsBrandAr = json['items_brand_ar'];
    itemsCatDetailesAr = json['items_catDetailes_ar'];
    itemsMainPW = json['items_mainPW'];
    itemsMainPWAr = json['items_mainPW_ar'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDatetime = json['categories_datetime'];
    favourite = json["favourite"];
    recent = json['recents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_image_2'] = this.itemsImage2;
    data['items_image_3'] = this.itemsImage3;
    data['items_image_4'] = this.itemsImage4;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_rate'] = this.itemsRate;
    data['items_Size'] = this.itemsSize;
    data['items_Size2'] = this.itemsSize2;
    data['items_Size3'] = this.itemsSize3;
    data['items_Size4'] = this.itemsSize4;
    data['items_delivery_refund'] = this.itemsDeliveryRefund;
    data['items_size_guide'] = this.itemsSizeGuide;
    data['isNewTrend'] = this.isNewTrend;
    data['items_isNew'] = this.itemsIsNew;
    data['items_Color'] = this.itemsColor;
    data['items_Color2'] = this.itemsColor2;
    data['items_Color3'] = this.itemsColor3;
    data['items_Color4'] = this.itemsColor4;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['items_brand'] = this.itemsBrand;
    data['items_catDetailes'] = this.itemsCatDetailes;
    data['items_brand_ar'] = this.itemsBrandAr;
    data['items_catDetailes_ar'] = this.itemsCatDetailesAr;
    data['items_mainPW'] = this.itemsMainPW;
    data['items_mainPW_ar'] = this.itemsMainPWAr;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_datetime'] = this.categoriesDatetime;
    data["favourite"] = this.favourite;
    data['recents'] = this.recent;
    return data;
  }
}
