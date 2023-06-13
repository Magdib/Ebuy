import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class AddreesData {
  CRUD crud;
  AddreesData(this.crud);

  addAddress(String userid, String name, String phoneNumber, String city,
      String street, String lat, String long) async {
    var response = await crud.postData("${AppServer.address}add.php", {
      "usersId": userid,
      "name": name,
      "phoneNumber": phoneNumber,
      "city": city,
      "street": street,
      "lat": lat,
      'long': long
    });
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String addressId, String name, String phoneNumber, String city,
      String street, String lat, String long) async {
    var response = await crud.postData("${AppServer.address}edit.php", {
      "addressId": addressId,
      "name": name,
      "phoneNumber": phoneNumber,
      "city": city,
      "street": street,
      "lat": lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeAddress(String addressId) async {
    var response = await crud
        .postData("${AppServer.address}remove.php", {"addressId": addressId});
    return response.fold((l) => l, (r) => r);
  }

  getAddresses(String usersId) async {
    var response = await crud
        .postData("${AppServer.address}view.php", {"usersId": usersId});
    return response.fold((l) => l, (r) => r);
  }
}
