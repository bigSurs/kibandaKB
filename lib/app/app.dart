import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
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
    return OverlaySupport.global(
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
            textTheme: GoogleFonts.poppinsTextTheme(),
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
    );
  }
}
