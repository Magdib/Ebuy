import 'package:ebuy/core/middleware/middleware.dart';
import 'package:ebuy/view/screens/Details/DetailsImagesview.dart';
import 'package:ebuy/view/screens/Home/Cart/Cart.dart';
import 'package:ebuy/view/screens/Home/Cart/CheckOut.dart';
import 'package:ebuy/view/screens/Home/Cart/OrderSuccess.dart';
import 'package:ebuy/view/screens/Home/Cart/SelectCountry.dart';
import 'package:ebuy/view/screens/Home/favourite/Favourite.dart';
import 'package:ebuy/view/screens/Home/HomePage/NewTrends.dart';
import 'package:ebuy/view/screens/Home/Settings/AccountPages/AccountPage.dart';
import 'package:ebuy/view/screens/Home/Settings/AccountPages/AddressBook.dart';
import 'package:ebuy/view/screens/Home/Settings/AccountPages/Contactpage.dart';
import 'package:ebuy/view/screens/Home/Settings/AccountPages/OrdersPage.dart';
import 'package:ebuy/view/screens/Home/Settings/AccountPages/PaymentPages/PaymentMethods.dart';
import 'package:ebuy/view/screens/Home/Settings/AccountPages/PremierDelivery.dart';
import 'package:ebuy/view/screens/Home/Settings/AccountPages/UsersDetailes.dart';
import 'package:ebuy/view/screens/Home/Settings/SettingsPages/SettingsPage.dart';
import 'package:ebuy/view/screens/Home/Settings/SettingsPages/language.dart';
import 'package:ebuy/view/screens/Home/search/SearchCategories.dart';
import 'package:ebuy/view/screens/Home/MainPage.dart';
import 'package:ebuy/view/screens/Home/search/Search.dart';
import 'package:ebuy/view/screens/Products/ProductsPage.dart';
import 'package:ebuy/view/screens/auth/CheckEmail.dart';
import 'package:ebuy/view/screens/auth/setNewPassword.dart';
import 'package:ebuy/view/screens/auth/SignIn.dart';
import 'package:ebuy/view/screens/auth/SignUp.dart';
import 'package:ebuy/view/screens/auth/verifyEmail.dart';
import 'package:get/get.dart';
import 'Controller/Home/SettingsControllers/GiftCardController.dart';
import 'view/screens/Details/DetailsPage.dart';
import 'view/screens/Home/Settings/AccountPages/GiftCardsPages/AddGiftCardPage.dart';
import 'view/screens/Home/Settings/AccountPages/GiftCardsPages/GiftCardsPage.dart';
import 'view/screens/Home/Settings/SettingsPages/notifications.dart';
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
  static const String accountPageRoute = '/AccountPage';
  static const String contactPageRoute = '/ContactPage';
  static const String paymentPageRoute = '/PaymentPage';
  static const String addressPageRoute = '/AddressPage';
  static const String usersDetailesPageRoute = '/usersDetailesPage';
  static const String deliveryPageRoute = '/DeliveryPage';
  static const String ordersPageRoute = '/OrdersPage';
  static const String giftCardPageRoute = '/giftCardPage';
  static const String settingsPageRoute = '/SettingsPage';
  static const String notificationsPageRoute = '/NotificationsPage';
  static const String languagePageRoute = '/LanguagePage';
  static const String addGiftCardPageRoute = '/addGiftCardPage';
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
  ),
  GetPage(
    name: AppRoutes.accountPageRoute,
    page: () => const AccountPage(),
  ),
  GetPage(
    name: AppRoutes.contactPageRoute,
    page: () => const ContactPage(),
  ),
  GetPage(
    name: AppRoutes.paymentPageRoute,
    page: () => const PaymentMethods(),
  ),
  GetPage(
    name: AppRoutes.addressPageRoute,
    page: () => const AddressBook(),
  ),
  GetPage(
    name: AppRoutes.usersDetailesPageRoute,
    page: () => const UsersDetailes(),
  ),
  GetPage(
    name: AppRoutes.deliveryPageRoute,
    page: () => const PremierDelivery(),
  ),
  GetPage(
    name: AppRoutes.ordersPageRoute,
    page: () => const OrdersPage(),
  ),
  GetPage(
      name: AppRoutes.giftCardPageRoute,
      page: () => const GiftCardsPage(),
      binding: BindingsBuilder.put(() => GiftCardControllerimp())),
  GetPage(
    name: AppRoutes.settingsPageRoute,
    page: () => const SettingsPage(),
  ),
  GetPage(
    name: AppRoutes.notificationsPageRoute,
    page: () => const NotificationsPage(),
  ),
  GetPage(
    name: AppRoutes.languagePageRoute,
    page: () => const LanguagePage(),
  ),
  GetPage(
    name: AppRoutes.addGiftCardPageRoute,
    page: () => const AddGiftCardPage(),
  )
];
