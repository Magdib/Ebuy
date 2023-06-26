import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/data/model/SettingsModels/PaymentModel.dart';

String paymentImage(int index, List<PaymentModel> paymentList) {
  switch (paymentList[index].paymentType) {
    case "Visa":
      return payMethods[0];

    case "Paypal":
      return payMethods[1];
    case "Master Card":
      return payMethods[2];
    case "American Express":
      return payMethods[3];

    default:
      return payMethods[4];
  }
}
