import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class GiftCardData {
  CRUD crud;
  GiftCardData(this.crud);
  checkGiftCard(String shortDigit, String longDigit, String usersId) async {
    var response = await crud.postData("${AppServer.giftCard}checkGiftCard.php",
        {"shortDigit": shortDigit, "longDigit": longDigit, "usersId": usersId});
    return response.fold((l) => l, (r) => r);
  }

  getGiftCards(String usersId) async {
    var response = await crud.postData(
        "${AppServer.giftCard}getGiftCards.php", {"usersId": usersId});
    return response.fold((l) => l, (r) => r);
  }

  useGiftCard(String cardId) async {
    var response = await crud
        .postData("${AppServer.giftCard}useCard.php", {"cardId": cardId});
    return response.fold((l) => l, (r) => r);
  }

  regetGiftCard(String cardId) async {
    var response = await crud
        .postData("${AppServer.giftCard}regetCard.php", {"cardId": cardId});
    return response.fold((l) => l, (r) => r);
  }
}
