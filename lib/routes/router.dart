import 'package:auto_route/auto_route.dart';
import 'package:kibanda_kb/delivery/delivery_details_page.dart';
import 'package:kibanda_kb/ui/address/my_addresses_page.dart';
import 'package:kibanda_kb/ui/home/cart/cart_page.dart';
import 'package:kibanda_kb/ui/home/cart/order_success_page.dart';
import 'package:kibanda_kb/ui/home/expanded_categories_page.dart';
import 'package:kibanda_kb/ui/home/main_home_page.dart';
import 'package:kibanda_kb/ui/login_page.dart';
import 'package:kibanda_kb/ui/splash_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: LoginPage),
  AutoRoute(page: MainHomePage),
  AutoRoute(page: MyAddressesPage),
  AutoRoute(page: ExpandedCategoriesPage),
  AutoRoute(page: OrderSuccessPage),
  AutoRoute(page: CartPage),
  AutoRoute(page: MyAddressesPage),
  AutoRoute(page: DeliveryDetailsPage)
])
class $AppRouter {}
