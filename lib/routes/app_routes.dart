import 'package:get/get.dart';
import 'package:tdc_mobile/presentation/grave_details_screen/binding/grave_details_binding.dart';
import 'package:tdc_mobile/presentation/grave_details_screen/grave_details_screen.dart';
import 'package:tdc_mobile/presentation/register_plot_screen/register_plot_screen.dart';
import '../presentation/cart_screen/binding/cart_binding.dart';
import '../presentation/cart_screen/cart_screen.dart';
import '../presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import '../presentation/forgot_password_screen/forgot_password.dart';
import '../presentation/home_screen/binding/home_binding.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/item_details_screen/binding/item_details_binding.dart';
import '../presentation/item_details_screen/item_details_screen.dart';
import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/main_wrapper/binding/main_wrapper_binding.dart';
import '../presentation/main_wrapper/main_wrapper.dart';
import '../presentation/map_screen/binding/map_binding.dart';
import '../presentation/map_screen/map_screen.dart';
import '../presentation/plot_screen/binding/plot_binding.dart';
import '../presentation/plot_screen/plot_screen.dart';
import '../presentation/profile_screen/binding/home_binding.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/register_plot_screen/binding/register_plot_binding.dart';
import '../presentation/register_screen/binding/register_binding.dart';
import '../presentation/register_screen/register_screen.dart';
import '../presentation/search_screen/binding/search_binding.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/services_screen/binding/services_binding.dart';
import '../presentation/services_screen/services_screen.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/user_screen/binding/user_binding.dart';
import '../presentation/user_screen/user_screen.dart';
import '../presentation/wallet_screen/binding/home_binding.dart';
import '../presentation/wallet_screen/wallet_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String userScreen = '/user_screen';

  static const String shoppingCartScreen = '/shoppingCart_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String graveDetailsScreen = '/grave_details_screen';

  static const String mainWrapper = '/main_wrapper';

  static const String mapScreen = '/map_screen';

  static const String plotScreen = '/plot_screen';

  static const String loginScreen = '/login_screen';

  static const String homeScreen = '/home_screen';

  static const String itemDetailScreen = '/item_detail_screen';

  static const String searchScreen = '/search_screen';

  static const String servicesScreen = '/services_screen';

  static const String profileScreen = '/profile_screen';

  static const String registerPlotScreen = '/register_plot_screen';

  static const String registerScreen = '/register_screen';

  static const String walletScreen = '/wallet_screen';

  // static const String initialRoute = '/initialRoute';
  static const String initialRoute = searchScreen;

  static List<GetPage> pages = [
    GetPage(
      name: shoppingCartScreen,
      page: () => CartScreen(),
      bindings: [
        CartBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: graveDetailsScreen,
      page: () => GraveDetailsScreen(),
      bindings: [
        GraveDetailsBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: itemDetailScreen,
      page: () => ItemDetailsScreen(),
      bindings: [
        ItemDetailsBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: mainWrapper,
      page: () => MainWrapper(),
      bindings: [
        MainWrapperBinding(),
      ],
    ),
    GetPage(
      name: mapScreen,
      page: () => MapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: plotScreen,
      page: () => PlotScreen(),
      bindings: [
        PLotBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: registerPlotScreen,
      page: () => RegisterPlotScreen(),
      bindings: [
        RegisterPlotBinding(),
      ],
    ),    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      bindings: [
        RegisterBinding(),
      ],
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreen(),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      name: servicesScreen,
      page: () => ServicesScreen(),
      bindings: [
        ServicesBinding(),
      ],
    ),
    GetPage(
      name: userScreen,
      page: () => UserScreen(),
      bindings: [
        UserBinding(),
      ],
    ),
    GetPage(
      name: walletScreen,
      page: () => WalletScreen(),
      bindings: [
        WalletBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
