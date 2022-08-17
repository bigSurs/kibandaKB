// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../delivery/delivery_details_page.dart' as _i8;
import '../ui/address/my_addresses_page.dart' as _i4;
import '../ui/home/cart/cart_page.dart' as _i7;
import '../ui/home/cart/order_success_page.dart' as _i6;
import '../ui/home/expanded_categories_page.dart' as _i5;
import '../ui/home/main_home_page.dart' as _i3;
import '../ui/login_page.dart' as _i2;
import '../ui/splash_screen.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    MainHomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainHomePage());
    },
    MyAddressesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MyAddressesPage());
    },
    ExpandedCategoriesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ExpandedCategoriesPage());
    },
    OrderSuccessRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.OrderSuccessPage());
    },
    CartRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CartPage());
    },
    DeliveryDetailsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.DeliveryDetailsPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashScreen.name, path: '/'),
        _i9.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i9.RouteConfig(MainHomeRoute.name, path: '/main-home-page'),
        _i9.RouteConfig(MyAddressesRoute.name, path: '/my-addresses-page'),
        _i9.RouteConfig(ExpandedCategoriesRoute.name,
            path: '/expanded-categories-page'),
        _i9.RouteConfig(OrderSuccessRoute.name, path: '/order-success-page'),
        _i9.RouteConfig(CartRoute.name, path: '/cart-page'),
        _i9.RouteConfig(DeliveryDetailsRoute.name,
            path: '/delivery-details-page')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i9.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.MainHomePage]
class MainHomeRoute extends _i9.PageRouteInfo<void> {
  const MainHomeRoute() : super(MainHomeRoute.name, path: '/main-home-page');

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i4.MyAddressesPage]
class MyAddressesRoute extends _i9.PageRouteInfo<void> {
  const MyAddressesRoute()
      : super(MyAddressesRoute.name, path: '/my-addresses-page');

  static const String name = 'MyAddressesRoute';
}

/// generated route for
/// [_i5.ExpandedCategoriesPage]
class ExpandedCategoriesRoute extends _i9.PageRouteInfo<void> {
  const ExpandedCategoriesRoute()
      : super(ExpandedCategoriesRoute.name, path: '/expanded-categories-page');

  static const String name = 'ExpandedCategoriesRoute';
}

/// generated route for
/// [_i6.OrderSuccessPage]
class OrderSuccessRoute extends _i9.PageRouteInfo<void> {
  const OrderSuccessRoute()
      : super(OrderSuccessRoute.name, path: '/order-success-page');

  static const String name = 'OrderSuccessRoute';
}

/// generated route for
/// [_i7.CartPage]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart-page');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i8.DeliveryDetailsPage]
class DeliveryDetailsRoute extends _i9.PageRouteInfo<void> {
  const DeliveryDetailsRoute()
      : super(DeliveryDetailsRoute.name, path: '/delivery-details-page');

  static const String name = 'DeliveryDetailsRoute';
}
