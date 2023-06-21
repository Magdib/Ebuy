class GiftCardModel {
  String? cardId;
  String? cardUsersid;
  String? cardShortDigit;
  String? cardLongDigit;
  String? cardDiscount;
  String? cardAvailable;
  String? cardExpireDate;

  GiftCardModel(
      {this.cardId,
      this.cardUsersid,
      this.cardShortDigit,
      this.cardLongDigit,
      this.cardDiscount,
      this.cardAvailable,
      this.cardExpireDate});

  GiftCardModel.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    cardUsersid = json['card_usersid'];
    cardShortDigit = json['card_shortDigit'];
    cardLongDigit = json['card_longDigit'];
    cardDiscount = json['card_discount'];
    cardAvailable = json['card_available'];
    cardExpireDate = json['card_expireDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    data['card_usersid'] = this.cardUsersid;
    data['card_shortDigit'] = this.cardShortDigit;
    data['card_longDigit'] = this.cardLongDigit;
    data['card_discount'] = this.cardDiscount;
    data['card_available'] = this.cardAvailable;
    data['card_expireDate'] = this.cardExpireDate;
    return data;
  }
}
