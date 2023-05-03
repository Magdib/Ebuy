import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';

int getProductIndex(
    List<Products> products, List<Products> searchedList, int wantedIndex) {
  int productIndex = products.indexWhere((product) =>
      product.itemsId!.contains(searchedList[wantedIndex].itemsId!));
  return productIndex;
}
