class PaymentModel {
  String? paymentId;
  String? paymentUsersid;
  String? paymentCardnumber;
  String? paymentName;
  String? paymentType;
  String? paymentExpiredate;

  PaymentModel(
      {this.paymentId,
      this.paymentUsersid,
      this.paymentCardnumber,
      this.paymentName,
      this.paymentType,
      this.paymentExpiredate});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    paymentUsersid = json['payment_usersid'];
    paymentCardnumber = json['payment_cardnumber'];
    paymentName = json['payment_name'];
    paymentType = json['payment_type'];
    paymentExpiredate = json['payment_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_id'] = this.paymentId;
    data['payment_usersid'] = this.paymentUsersid;
    data['payment_cardnumber'] = this.paymentCardnumber;
    data['payment_name'] = this.paymentName;
    data['payment_type'] = this.paymentType;
    data['payment_expiredate'] = this.paymentExpiredate;
    return data;
  }
}
