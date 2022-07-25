import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:kibanda_kb/routes/router.dart';

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
      providers: [],
      child: OverlaySupport.global(
        child: MaterialApp.router(
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        ),
      ),
    );
  }
}
