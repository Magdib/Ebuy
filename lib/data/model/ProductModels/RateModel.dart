class RateModel {
  String userImage, username, comment, rateTime;
  bool isLiked;
  double rate;
  RateModel(
      {required this.username,
      required this.userImage,
      required this.comment,
      required this.rate,
      required this.isLiked,
      required this.rateTime});
}
