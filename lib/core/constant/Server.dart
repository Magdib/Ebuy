class AppServer {
  static const server = "https://ebuycv.000webhostapp.com/";
  //auth
  static const String auth = "${server}auth/";
  static const String signup = "${server}auth/signup.php";
  static const String emailVerification = "${server}auth/verfiycode.php";
  static const String signin = "${server}auth/login.php";
  static const String checkemail = "${server}forgetpassword/checkemail.php";
  static const String codeVerification =
      "${server}forgetpassword/verifycode.php";
  static const String reSendVerification = "${server}auth/reSend.php";
  static const String setNewPassword =
      "${server}forgetpassword/resetpassword.php";
  //Home
  static const String homeFolder = "${server}Home/";
  static const String home = "${homeFolder}home.php";
  static const String recentAdd = "${homeFolder}addToRecent.php";
  static const String recentRemove = "${homeFolder}removeFromRecent.php";
  static const String upload = "${server}upload/";
  static const String bannersImages = "${upload}banners";
  static const String itemsImages = "${upload}items/";
  static const String usersImages = "${upload}usersImages/";
  //Favourite
  static const String favourite = "${server}favourite/";
  static const String favouriteItems = "${favourite}getFavouriteItems.php";
  //Cart
  static const String cart = "${server}cart/";
  static const String giftCard = "${server}giftCards/";
  static const String giftVoucher = "${server}giftVoucher/";
  static const String orders = "${server}orders/";
  //Settings
  static const String address = "${server}address/";
  static const String payment = "${server}Payment/";
  //Detailes
  static const String comments = "${server}comments/";
  static const String items = "${server}items/";
}
