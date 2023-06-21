import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class VoucherData {
  CRUD crud;
  VoucherData(this.crud);

  checkVoucher(String voucherCode) async {
    var response = await crud.postData(
        "${AppServer.giftVoucher}get.php", {"voucherCode": voucherCode});
    return response.fold((l) => l, (r) => r);
  }

  reGetGift(String voucherCode) async {
    var response = await crud.postData(
        "${AppServer.giftVoucher}reget.php", {"voucherCode": voucherCode});
    return response.fold((l) => l, (r) => r);
  }
}
