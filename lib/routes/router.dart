





import 'package:auto_route/auto_route.dart';
import 'package:kibanda_kb/ui/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
  ]
)
class $AppRouter {}