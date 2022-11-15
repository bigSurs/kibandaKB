// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/cupertino.dart' as _i16;
import 'package:flutter/material.dart' as _i15;

import '../delivery/delivery_details_page.dart' as _i13;
import '../models/order/order.dart' as _i17;
import '../ui/address/my_addresses_page.dart' as _i4;
import '../ui/home/cart/cart_page.dart' as _i8;
import '../ui/home/cart/order_success_page.dart' as _i6;
import '../ui/home/expanded_categories_page.dart' as _i5;
import '../ui/home/main_home_page.dart' as _i3;
import '../ui/home/my_orders/my_orders_page.dart' as _i10;
import '../ui/home/my_orders/single_order_page.dart' as _i11;
import '../ui/home/payments/mpesa_payment_page.dart' as _i9;
import '../ui/home/payments/payment_options_page.dart' as _i7;
import '../ui/home/transactions_page/transaction_page.dart' as _i12;
import '../ui/login_page.dart' as _i2;
import '../ui/splash_screen.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    MainHomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainHomePage(),
      );
    },
    MyAddressesRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MyAddressesPage(),
      );
    },
    ExpandedCategoriesRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ExpandedCategoriesPage(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.OrderSuccessPage(),
      );
    },
    PaymentOPtionsRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentOPtionsRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.PaymentOPtionsPage(
          key: args.key,
          orderData: args.orderData,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.CartPage(),
      );
    },
    MpesaPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<MpesaPaymentRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.MpesaPaymentPage(
          key: args.key,
          orderReference: args.orderReference,
          data: args.data,
        ),
      );
    },
    MyOrdersRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MyOrdersPage(),
      );
    },
    SingleOrderRoute.name: (routeData) {
      final args = routeData.argsAs<SingleOrderRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.SingleOrderPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    TransactionRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.TransactionPage(
          key: args.key,
          transactionData: args.transactionData,
          orderData: args.orderData,
        ),
      );
    },
    DeliveryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryDetailsRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.DeliveryDetailsPage(
          key: args.key,
          orderData: args.orderData,
        ),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i14.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i14.RouteConfig(
          MainHomeRoute.name,
          path: '/main-home-page',
        ),
        _i14.RouteConfig(
          MyAddressesRoute.name,
          path: '/my-addresses-page',
        ),
        _i14.RouteConfig(
          ExpandedCategoriesRoute.name,
          path: '/expanded-categories-page',
        ),
        _i14.RouteConfig(
          OrderSuccessRoute.name,
          path: '/order-success-page',
        ),
        _i14.RouteConfig(
          PaymentOPtionsRoute.name,
          path: '/payment-options-page',
        ),
        _i14.RouteConfig(
          CartRoute.name,
          path: '/cart-page',
        ),
        _i14.RouteConfig(
          MyAddressesRoute.name,
          path: '/my-addresses-page',
        ),
        _i14.RouteConfig(
          MpesaPaymentRoute.name,
          path: '/mpesa-payment-page',
        ),
        _i14.RouteConfig(
          MyOrdersRoute.name,
          path: '/my-orders-page',
        ),
        _i14.RouteConfig(
          SingleOrderRoute.name,
          path: '/single-order-page',
        ),
        _i14.RouteConfig(
          TransactionRoute.name,
          path: '/transaction-page',
        ),
        _i14.RouteConfig(
          DeliveryDetailsRoute.name,
          path: '/delivery-details-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i14.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.MainHomePage]
class MainHomeRoute extends _i14.PageRouteInfo<void> {
  const MainHomeRoute()
      : super(
          MainHomeRoute.name,
          path: '/main-home-page',
        );

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i4.MyAddressesPage]
class MyAddressesRoute extends _i14.PageRouteInfo<void> {
  const MyAddressesRoute()
      : super(
          MyAddressesRoute.name,
          path: '/my-addresses-page',
        );

  static const String name = 'MyAddressesRoute';
}

/// generated route for
/// [_i5.ExpandedCategoriesPage]
class ExpandedCategoriesRoute extends _i14.PageRouteInfo<void> {
  const ExpandedCategoriesRoute()
      : super(
          ExpandedCategoriesRoute.name,
          path: '/expanded-categories-page',
        );

  static const String name = 'ExpandedCategoriesRoute';
}

/// generated route for
/// [_i6.OrderSuccessPage]
class OrderSuccessRoute extends _i14.PageRouteInfo<void> {
  const OrderSuccessRoute()
      : super(
          OrderSuccessRoute.name,
          path: '/order-success-page',
        );

  static const String name = 'OrderSuccessRoute';
}

/// generated route for
/// [_i7.PaymentOPtionsPage]
class PaymentOPtionsRoute extends _i14.PageRouteInfo<PaymentOPtionsRouteArgs> {
  PaymentOPtionsRoute({
    _i16.Key? key,
    required Map<String, dynamic> orderData,
  }) : super(
          PaymentOPtionsRoute.name,
          path: '/payment-options-page',
          args: PaymentOPtionsRouteArgs(
            key: key,
            orderData: orderData,
          ),
        );

  static const String name = 'PaymentOPtionsRoute';
}

class PaymentOPtionsRouteArgs {
  const PaymentOPtionsRouteArgs({
    this.key,
    required this.orderData,
  });

  final _i16.Key? key;

  final Map<String, dynamic> orderData;

  @override
  String toString() {
    return 'PaymentOPtionsRouteArgs{key: $key, orderData: $orderData}';
  }
}

/// generated route for
/// [_i8.CartPage]
class CartRoute extends _i14.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart-page',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i9.MpesaPaymentPage]
class MpesaPaymentRoute extends _i14.PageRouteInfo<MpesaPaymentRouteArgs> {
  MpesaPaymentRoute({
    _i16.Key? key,
    required String orderReference,
    required Map<String, dynamic> data,
  }) : super(
          MpesaPaymentRoute.name,
          path: '/mpesa-payment-page',
          args: MpesaPaymentRouteArgs(
            key: key,
            orderReference: orderReference,
            data: data,
          ),
        );

  static const String name = 'MpesaPaymentRoute';
}

class MpesaPaymentRouteArgs {
  const MpesaPaymentRouteArgs({
    this.key,
    required this.orderReference,
    required this.data,
  });

  final _i16.Key? key;

  final String orderReference;

  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'MpesaPaymentRouteArgs{key: $key, orderReference: $orderReference, data: $data}';
  }
}

/// generated route for
/// [_i10.MyOrdersPage]
class MyOrdersRoute extends _i14.PageRouteInfo<void> {
  const MyOrdersRoute()
      : super(
          MyOrdersRoute.name,
          path: '/my-orders-page',
        );

  static const String name = 'MyOrdersRoute';
}

/// generated route for
/// [_i11.SingleOrderPage]
class SingleOrderRoute extends _i14.PageRouteInfo<SingleOrderRouteArgs> {
  SingleOrderRoute({
    _i16.Key? key,
    required _i17.Order order,
  }) : super(
          SingleOrderRoute.name,
          path: '/single-order-page',
          args: SingleOrderRouteArgs(
            key: key,
            order: order,
          ),
        );

  static const String name = 'SingleOrderRoute';
}

class SingleOrderRouteArgs {
  const SingleOrderRouteArgs({
    this.key,
    required this.order,
  });

  final _i16.Key? key;

  final _i17.Order order;

  @override
  String toString() {
    return 'SingleOrderRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i12.TransactionPage]
class TransactionRoute extends _i14.PageRouteInfo<TransactionRouteArgs> {
  TransactionRoute({
    _i16.Key? key,
    dynamic transactionData,
    required Map<String, dynamic> orderData,
  }) : super(
          TransactionRoute.name,
          path: '/transaction-page',
          args: TransactionRouteArgs(
            key: key,
            transactionData: transactionData,
            orderData: orderData,
          ),
        );

  static const String name = 'TransactionRoute';
}

class TransactionRouteArgs {
  const TransactionRouteArgs({
    this.key,
    this.transactionData,
    required this.orderData,
  });

  final _i16.Key? key;

  final dynamic transactionData;

  final Map<String, dynamic> orderData;

  @override
  String toString() {
    return 'TransactionRouteArgs{key: $key, transactionData: $transactionData, orderData: $orderData}';
  }
}

/// generated route for
/// [_i13.DeliveryDetailsPage]
class DeliveryDetailsRoute
    extends _i14.PageRouteInfo<DeliveryDetailsRouteArgs> {
  DeliveryDetailsRoute({
    _i16.Key? key,
    required Map<String, dynamic> orderData,
  }) : super(
          DeliveryDetailsRoute.name,
          path: '/delivery-details-page',
          args: DeliveryDetailsRouteArgs(
            key: key,
            orderData: orderData,
          ),
        );

  static const String name = 'DeliveryDetailsRoute';
}

class DeliveryDetailsRouteArgs {
  const DeliveryDetailsRouteArgs({
    this.key,
    required this.orderData,
  });

  final _i16.Key? key;

  final Map<String, dynamic> orderData;

  @override
  String toString() {
    return 'DeliveryDetailsRouteArgs{key: $key, orderData: $orderData}';
  }
}
