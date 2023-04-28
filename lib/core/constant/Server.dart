class AppServer {
  static const server = "https://ebuycv.000webhostapp.com/";
  //auth

  static const String signup = "${server}auth/signup.php";
  static const String emailVerification = "${server}auth/verfiycode.php";
  static const String signin = "${server}auth/login.php";
  static const String checkemail = "${server}forgetpassword/checkemail.php";
  static const String codeVerification =
      "${server}forgetpassword/verifycode.php";
  static const String setNewPassword =
      "${server}forgetpassword/resetpassword.php";
  static const String home = "${server}home.php";
  static const String images = "${server}upload";
  static const String bannersImages = "$images/banners";
  static const String itemsImages = "$images/items/";
  static const String favourite = "${server}favourite/";
  static const String favouriteItems = "${favourite}getFavouriteItems.php";
}
