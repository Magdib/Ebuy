class Products {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsRate;
  String? itemsDeliveryRefund;
  String? itemsSizeGuide;
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

  Products(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsRate,
      this.itemsDeliveryRefund,
      this.itemsSizeGuide,
      this.itemsDate,
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
      this.categoriesDatetime});

  Products.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsRate = json['items_rate'];
    itemsDeliveryRefund = json['items_delivery_refund'];
    itemsSizeGuide = json['items_size_guide'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_rate'] = this.itemsRate;
    data['items_delivery_refund'] = this.itemsDeliveryRefund;
    data['items_size_guide'] = this.itemsSizeGuide;
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
    return data;
  }
}
