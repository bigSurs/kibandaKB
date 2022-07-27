import 'package:auto_route/auto_route.dart';
import 'package:kibanda_kb/ui/home/main_home_page.dart';
import 'package:kibanda_kb/ui/login_page.dart';
import 'package:kibanda_kb/ui/splash_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: LoginPage),
  AutoRoute(page: MainHomePage),
])
class $AppRouter {}
