import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';
import 'package:kibanda_kb/authentication/token_cubit.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/session_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      //
      TokenCubit tokenCubit = BlocProvider.of<TokenCubit>(context);
      SessionCubit sessionCubit = BlocProvider.of<SessionCubit>(context);
      CustomerTokenCubit customertokenCubit =
          BlocProvider.of<CustomerTokenCubit>(context);
      CartProductMetadataCubit cartProductMetadataCubit =
          BlocProvider.of<CartProductMetadataCubit>(context);
      GetIt.I.registerSingleton(tokenCubit);
      GetIt.I.registerSingleton(customertokenCubit);
      GetIt.I.registerSingleton(sessionCubit);
      GetIt.I.registerSingleton(cartProductMetadataCubit);
      if (tokenCubit.state.isNotEmpty) {
        AutoRouter.of(context).replace(const MainHomeRoute());
      } else {
        AutoRouter.of(context).replace(const LoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Positioned(
          left: 200,
          right: 200,
          top: 200,
          child: Center(
            child: SpinKitCircle(
              color: Palette.greenColor,
            ),
          ),
        ),
        const Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Center(
            child: Text.rich(TextSpan(
                text: 'Kwik ',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Palette.orangeColor),
                children: [
                  TextSpan(
                      text: 'Kibanda',
                      style: TextStyle(color: Palette.greenColor))
                ])),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: Image.asset(
              'assets/truck_image.png',
              width: MediaQuery.of(context).size.width + 20,
            ))
      ],
    ));
  }
}
