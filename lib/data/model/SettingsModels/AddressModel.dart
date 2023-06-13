class AddressModel {
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressPhone;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressPhone,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressPhone = json['address_phone'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_name'] = this.addressName;
    data['address_phone'] = this.addressPhone;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
