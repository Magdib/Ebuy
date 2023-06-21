String fixPriceNumbers(String price) {
  String tempPrice;
  price.length > 10
      ? tempPrice = double.parse(price).toStringAsFixed(0)
      : tempPrice = double.parse(price).toStringAsFixed(2);
  return tempPrice;
}
