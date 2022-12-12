import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/authentication/customer_cookie_cubit.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';
import 'package:kibanda_kb/authentication/token_cubit.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/address/delivery_address_selection_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/session_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/delivery_timeslot/delivery_timeslot_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/featured_product_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/payments/lipa_na_mpesa_cubit/lipa_na_mpesa_cubit.dart';

import 'package:kibanda_kb/cubits/cubit/payments/payment_method_cubit/payment_method_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/payments/payment_method_cubit/selected_payment_method_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/place_order_cubit/place_order_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/save_to_basket_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/transactional_payment/transactional_payment_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/home_bottom_index_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/transaction_top_index_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/validate_order_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/wishlist_cubit.dart';
import 'package:kibanda_kb/cubits/customer_address/customer_address_cubit.dart';
import 'package:kibanda_kb/cubits/kibandalist/kibandalist_cubit.dart';
import 'package:kibanda_kb/cubits/login_cubit/login_cubit.dart';
import 'package:kibanda_kb/cubits/my_orders_cubit/my_orders_cubit.dart';
import 'package:kibanda_kb/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:kibanda_kb/cubits/select_date_timeslot/select_date_cubit.dart';
import 'package:kibanda_kb/cubits/select_date_timeslot/select_timeslot_cubit.dart';
import 'package:kibanda_kb/cubits/transactions/transaction_cubit.dart';
import 'package:kibanda_kb/cubits/vendor_products/vendor_products_cubit.dart';
import 'package:kibanda_kb/models/payment_method/payment_method.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/ui/home/main_home_page.dart';
import 'package:kibanda_kb/ui/home/payments/payment_options_page.dart';
import 'package:kibanda_kb/ui/home/product/expanded_product_widget.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:kibanda_kb/routes/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class KwikBasketKibandaApp extends StatelessWidget {
  KwikBasketKibandaApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => KibandalistCubit()..getVibandas()),
        BlocProvider(create: (context) => TokenCubit('')),
        BlocProvider(
          create: (context) => SessionCubit(''),
        ),
        BlocProvider(create: (context) => CustomerCookieCubit('')),
        BlocProvider(create: (context) => CustomerTokenCubit('')),
        BlocProvider(create: (context) => VendorProductsCubit()),
        BlocProvider(create: (context) => SelectedKibandaCubit()),
        BlocProvider(create: (context) => TransactionalPaymentCubit()),
        BlocProvider(create: (context) => KibandalistCubit()..getVibandas()),
        BlocProvider(
            create: (context) => FeaturedProductCubit()
              ..getFeaturedProducts(page: 1, customerId: 15)),
        BlocProvider(create: (context) => HomeBottomIndexCubit(0)),
        BlocProvider(create: (context) => TransactionIndexCubit(0)),
        BlocProvider(
            create: (context) => TransactionCubit()..getallTransactions()),
        BlocProvider(create: (context) => CartCubit([])),
        BlocProvider(create: (context) => CartProductMetadataCubit([])),
        BlocProvider(create: (context) => SelectedVariationCubit()),
        BlocProvider(
          create: (context) => PaymentMethodCubit(),
        ),
        BlocProvider(
          create: (context) => OrderDetailsCubit(),
        ),
        BlocProvider(
          create: (context) =>
              SelectedPaymentMethodCubit(PaymentMethod(code: 'cod')),
        ),
        BlocProvider(
          create: (context) => LipaNaMpesaCubit(),
        ),
        BlocProvider(create: (context) => SaveToBasketCubit()),
        BlocProvider(create: (context) => ValidateOrderCubit()),
        BlocProvider(create: (context) => WishlistCubit()),
        BlocProvider(create: (context) => CustomerAddressCubit()),
        // BlocProvider(create: (context) => FeaturedProductCubit()),
        BlocProvider(create: (context) => PlaceOrderCubit()),
        BlocProvider(create: (context) => DeliveryTimeslotCubit()),
        BlocProvider(
          create: (context) => MyOrdersCubit()..getMyOrders(),
        ),
        BlocProvider(create: (context) => HybridSelectedCubit()),
        BlocProvider(create: (context) => DeliveryAddressSelectionCubit(null)),
        BlocProvider(create: (context) => SelectDeliveryDateCubit()),
        BlocProvider(create: (context) => SelectTimeslotCubit('')),
      ],
      child: OverlaySupport.global(
        child: MaterialApp.router(
          title: 'Kwikbasket Delivery App',
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('en'),
          ],
          localizationsDelegates: const [
            FormBuilderLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
              primaryColor: Palette.greenColor,
              colorScheme: const ColorScheme(
                  primary: Palette.greenColor,
                  secondary: Palette.orangeColor,
                  surface: Colors.white,
                  background: Colors.white,
                  error: Colors.red,
                  onPrimary: Colors.white,
                  onSecondary: Colors.white,
                  onSurface: Palette.greenColor,
                  onBackground: Palette.greenColor,
                  onError: Colors.white,
                  brightness: Brightness.light)),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        ),
      ),
    );
  }
}
