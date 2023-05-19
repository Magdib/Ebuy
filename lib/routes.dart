import 'package:ebuy/core/middleware/middleware.dart';
import 'package:ebuy/view/screens/Details/DetailsImagesview.dart';
import 'package:ebuy/view/screens/Home/Cart/Cart.dart';
import 'package:ebuy/view/screens/Home/Cart/CheckOut.dart';
import 'package:ebuy/view/screens/Home/Cart/OrderSuccess.dart';
import 'package:ebuy/view/screens/Home/Cart/SelectCountry.dart';
import 'package:ebuy/view/screens/Home/Favourite.dart';
import 'package:ebuy/view/screens/Home/HomePage/NewTrends.dart';
import 'package:ebuy/view/screens/Home/HomePage/search/SearchCategories.dart';
import 'package:ebuy/view/screens/Home/MainPage.dart';
import 'package:ebuy/view/screens/Home/HomePage/search/Search.dart';
import 'package:ebuy/view/screens/Products/ProductsPage.dart';
import 'package:ebuy/view/screens/auth/CheckEmail.dart';
import 'package:ebuy/view/screens/auth/setNewPassword.dart';
import 'package:ebuy/view/screens/auth/SignIn.dart';
import 'package:ebuy/view/screens/auth/SignUp.dart';
import 'package:ebuy/view/screens/auth/verifyEmail.dart';
import 'package:get/get.dart';
import 'view/screens/Details/DetailsPage.dart';
import 'view/screens/OnBoarding/OnBoarding.dart';
import 'view/screens/auth/ForgotPasswordVerificaton.dart';

class AppRoutes {
  static const String signUpRoute = '/SignUp';
  static const String signInRoute = '/SignIn';
  static const String setnewPasswordRoute = "/SetNewPassword";

  static const String emailVerificationRoute = "/emailVerification";
  static const String checkEmailRoute = "/CheckEmail";
  static const String forgotPasswordVerificatonRoute =
      "/ForgotPasswordVerificaton";
  static const String mainPageRoute = "/MainPage";
  static const String newTrendRoute = "/NewTrend";
  static const String cartRoute = "/Cart";
  static const String searchRoute = "/Search";
  static const String favouriteRoute = "/favourite";
  static const String accoutSettingsRoute = "/accountSettings";
  static const String detailsPageRoute = "/DetailsPage";
  static const String productImagesRoute = "/productImages";
  static const String productsPageRoute = "/productsPage";
  static const String searchCategoriesRoute = "/searchCategories";
  static const String checkOutRoute = "/checkOut";
  static const String orderSuccessRoute = "/orderSuccess";
  static const String selectCountryRoute = "/SelectCountry";
}

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoutes.signInRoute, page: () => const SignIn()),
  GetPage(name: AppRoutes.signUpRoute, page: () => const Signup()),
  GetPage(name: AppRoutes.checkEmailRoute, page: () => const CheckEmail()),
  GetPage(
      name: AppRoutes.forgotPasswordVerificatonRoute,
      page: () => const ForgotPasswordVerificaton()),
  GetPage(
      name: AppRoutes.setnewPasswordRoute, page: () => const SetNewPassword()),
  GetPage(
      name: AppRoutes.emailVerificationRoute,
      page: () => const EmailVerification()),
  GetPage(name: AppRoutes.mainPageRoute, page: () => const MainPage()),
  GetPage(
    name: AppRoutes.newTrendRoute,
    page: () => const NewTrendPage(),
  ),
  GetPage(name: AppRoutes.cartRoute, page: () => const CartPage()),
  GetPage(name: AppRoutes.searchRoute, page: () => const SearchPage()),
  GetPage(name: AppRoutes.cartRoute, page: () => const FavouritePage()),
  GetPage(name: AppRoutes.detailsPageRoute, page: () => const DetailsPage()),
  GetPage(
      name: AppRoutes.productImagesRoute,
      page: () => const ProductImagesView()),
  GetPage(name: AppRoutes.productsPageRoute, page: () => const ProductsPage()),
  GetPage(
    name: AppRoutes.searchCategoriesRoute,
    page: () => const SearchCategories(),
  ),
  GetPage(
    name: AppRoutes.checkOutRoute,
    page: () => const CheckOut(),
  ),
  GetPage(
    name: AppRoutes.orderSuccessRoute,
    page: () => const OrderSuccess(),
  ),
  GetPage(
    name: AppRoutes.selectCountryRoute,
    page: () => const SelectCountry(),
  )
];
