import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/address/delivery_address_selection_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/payments/payment_method_cubit/payment_method_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/payments/payment_method_cubit/selected_payment_method_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/place_order_cubit/place_order_cubit.dart';
import 'package:kibanda_kb/models/payment_method/payment_method.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/security/app_security.dart';
import 'package:kibanda_kb/ui/home/main_home_page.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';

class PaymentOPtionsPage extends StatefulWidget {
  final Map<String, dynamic> orderData;
  PaymentOPtionsPage({Key? key, required this.orderData}) : super(key: key);

  @override
  State<PaymentOPtionsPage> createState() => _PaymentOPtionsPageState();
}

class _PaymentOPtionsPageState extends State<PaymentOPtionsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<PaymentMethodCubit>().getPaymentMethods(
        (context.read<CartCubit>().getBalance() +
            context.read<CartCubit>().getTax()));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Payment Options',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocConsumer<PaymentMethodCubit, PaymentMethodState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              failed: (e) {
                AppToast.showToast(message: e, isError: true);
              });
        },
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return Container();
          }, loading: () {
            return Center(
              child: SpinKitSpinningLines(color: Palette.greenColor),
            );
          }, success: (methods) {
            return BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    success: () {
                      // if (context.read<HybridSelectedCubit>().state) {
                      //   if (context.read<HybridTypeCubit>().state == 'mpesa') {
                      //     AutoRouter.of(context).replace(MpesaPaymentRoute(
                      //         orderReference:
                      //             orderData['order_reference_number']));
                      //   } else {
                      //     AutoRouter.of(context).push(OrderSuccessRoute());
                      //     context.read<CartCubit>().emit([]);
                      //     context.read<CartProductMetadataCubit>().emit([]);
                      //   }
                      // } else {
                      // if (context
                      //         .read<SelectedPaymentMethodCubit>()
                      //         .state!
                      //         .code ==
                      //     'mpesa') {
                      //   AutoRouter.of(context).replace(MpesaPaymentRoute(
                      //       orderReference:
                      //           orderData['order_reference_number']));
                      // } else {
                      AutoRouter.of(context).push(OrderSuccessRoute());
                      context.read<CartCubit>().emit([]);
                      context.read<CartProductMetadataCubit>().emit([]);
                      // }
                    },
                    failed: (e) {
                      AppToast.showToast(message: e, isError: true);
                    });
              },
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () => Center(
                          child:
                              SpinKitSpinningLines(color: Palette.greenColor),
                        ),
                    orElse: () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Do you have any promotional code?',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              color: Palette.orangeBackgroundColor,
                              padding: EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 16),
                                            child: Icon(
                                              Icons.receipt,
                                              color: Palette.orangeColor,
                                            ),
                                          ),
                                          Expanded(
                                              child: FormBuilderTextField(
                                            name: 'promo_code',
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'Enter your code here'),
                                          )),
                                          CupertinoButton(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  topRight: Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12)),
                                              child: Icon(Icons.arrow_forward),
                                              color: Palette.orangeColor,
                                              onPressed: () {})
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '* Some promotional codes are specific to certain categories',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Choose your mode of payment',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(spacing: 16, children: [
                                ...List.generate(methods.length, (index) {
                                  String code = methods[index].code!;
                                  String title = methods[index].title!;
                                  String terms = methods[index].terms!;
                                  if (code == 'wallet') {
                                    return WalletPaymentWidget(
                                        method: methods[index]);
                                  } else if (code == 'cod') {
                                    return CorporatePaymentWidget(
                                      method: methods[index],
                                    );
                                  } else if (code == 'mpesa') {
                                    return MpesaOnlinePaymentWidget(
                                      method: methods[index],
                                    );
                                  } else if (code == 'mod') {
                                    return MpesaOnDeliveryPaymentWidget(
                                      method: methods[index],
                                    );
                                  } else if (code == 'pezesha') {
                                    return PezeshaPaymentWidget(
                                      method: methods[index],
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                                methods.any((e) => e.code == 'wallet')
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Hybrid payment (Use your wallet with another payment method)'),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                methods.any((e) => e.code == 'wallet')
                                    ? BlocListener<HybridSelectedCubit, bool>(
                                        listener: (context, state) {
                                          if (state) {
                                            context
                                                .read<
                                                    SelectedPaymentMethodCubit>()
                                                .emit(PaymentMethod(
                                                    title: 'Hybrid',
                                                    code: 'hybridwallet'));
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    width: 4,
                                                    color: context
                                                                .watch<
                                                                    SelectedPaymentMethodCubit>()
                                                                .state!
                                                                .code ==
                                                            'hybridwallet'
                                                        ? Palette.greenColor
                                                        : Colors.white)),
                                            child: ExpansionTile(
                                              title: Text('Hybrid Payment'),
                                              onExpansionChanged: (val) {
                                                context
                                                    .read<HybridSelectedCubit>()
                                                    .emit(val);
                                              },
                                              children: [
                                                FormBuilderRadioGroup<String>(
                                                    name: 'name',
                                                    initialValue: context
                                                        .read<HybridTypeCubit>()
                                                        .state,
                                                    onChanged: (val) {
                                                      context
                                                          .read<
                                                              HybridTypeCubit>()
                                                          .emit(val!);
                                                    },
                                                    options: [
                                                      ...List.generate(
                                                          methods
                                                              .where((element) =>
                                                                  element
                                                                      .code! !=
                                                                  'wallet')
                                                              .length, (index) {
                                                        var thods = methods
                                                            .where((element) =>
                                                                element.code! !=
                                                                'wallet')
                                                            .toList();
                                                        return FormBuilderFieldOption(
                                                          value: thods[index]
                                                              .code!
                                                              .toLowerCase(),
                                                          child: Text(
                                                              'Wallet + ${methods[index].title}'),
                                                        );
                                                      }),
                                                    ])
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ]),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ));
              },
            );
          });
        },
      ),
      bottomNavigationBar: Container(
        height: 54,
        color: Palette.greyColor,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.watch<CartCubit>().state.length} items',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "KES " +
                      (context.watch<CartCubit>().getBalance() +
                              context.watch<CartCubit>().getTax())
                          .toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: SizedBox(
                height: 30,
                child: CupertinoButton(
                  color: Palette.orangeColor,
                  onPressed: () async {
                    // bool authenticate = await AppSecurity.authenticate(
                    //     'Please authenticate to place your order');
                    // if (authenticate) {
                    if (context.read<SelectedPaymentMethodCubit>().state !=
                        null) {
                      var data = widget.orderData;
                      data.addAll({
                        "payment_method": context
                            .read<SelectedPaymentMethodCubit>()
                            .state!
                            .title!,
                        "dropoff_notes": '',
                        "payment_method_code": context
                            .read<SelectedPaymentMethodCubit>()
                            .state!
                            .code!,
                        "shipping_address_id": context
                            .read<SelectedKibandaCubit>()
                            .state!
                            .address_id!,
                        // "shipping_city_id": context
                        //     .read<DeliveryAddressSelectionCubit>()
                        //     .state!
                        //     .address_id!,
                        // 'login_latitude':
                        //     context.read<UserLocationCubit>().state.latitude,
                        // 'login_longitude':
                        //     context.read<UserLocationCubit>().state.longitude,
                        'login_mode': 'm',
                        "payment_method['code']": context
                            .read<SelectedPaymentMethodCubit>()
                            .state!
                            .code!,
                        "payment_method['sort_order']": context
                                .read<SelectedPaymentMethodCubit>()
                                .state!
                                .sort_order ??
                            '0',
                        "payment_method['terms']": context
                                .read<SelectedPaymentMethodCubit>()
                                .state!
                                .terms ??
                            '',
                        "payment_method['title']": context
                                .read<SelectedPaymentMethodCubit>()
                                .state!
                                .title ??
                            '',
                      });
                     
                      if (context.read<HybridSelectedCubit>().state) {
                        if (context.read<HybridTypeCubit>().state == 'mpesa') {
                        } else {}
                      } else {
                        if (context
                                .read<SelectedPaymentMethodCubit>()
                                .state!
                                .code ==
                            'mpesa') {
                          data.addAll({
                            'mpesa_refrence_id':
                                widget.orderData['order_reference_number']
                          });
                          // TODO: Add mpesa payment
                          var phoneData = await AutoRouter.of(context).push(
                              MpesaPaymentRoute(
                                  orderReference: widget
                                      .orderData['order_reference_number'],
                                  data: data));
                          data.addAll(phoneData as Map<String, dynamic>);
                          context.read<PlaceOrderCubit>().placeOrderMpesa(data);
                        } else {
                          context.read<PlaceOrderCubit>().placeOrder(data);
                        }
                      }
                    } else {
                      AppToast.showToast(
                          message: 'Please select a payment method',
                          isError: true);
                    }
                    // } else {
                    //   AppToast.showToast(
                    //       message: 'Device authentication failed',
                    //       isError: true);
                    // }
                  },
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Order',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        CupertinoIcons.chevron_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class PezeshaPaymentWidget extends StatelessWidget {
  final PaymentMethod method;
  const PezeshaPaymentWidget({Key? key, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 4,
              color: context.watch<SelectedPaymentMethodCubit>().state!.code ==
                      method.code
                  ? Palette.greenColor
                  : Colors.white)),
      child: ListTile(
        onTap: () {
          context.read<SelectedPaymentMethodCubit>().emit(method);
        },
        leading: Icon(
          Icons.account_balance_wallet_outlined,
          color: Palette.orangeColor,
        ),
        title: Text(
          method.title!,
          style: TextStyle(fontSize: 14),
        ),
        subtitle: Text(method.terms1!),
      ),
    );
  }
}

///Wallet widget
class WalletPaymentWidget extends StatelessWidget {
  final PaymentMethod method;
  const WalletPaymentWidget({Key? key, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 4,
              color: context.watch<SelectedPaymentMethodCubit>().state!.code ==
                      method.code
                  ? Palette.greenColor
                  : Colors.white)),
      child: ListTile(
        onTap: () {
          context.read<SelectedPaymentMethodCubit>().emit(method);
        },
        leading: Icon(
          Icons.account_balance_wallet_outlined,
          color: Palette.orangeColor,
        ),
        title: Text(
          method.title!,
          style: TextStyle(fontSize: 14),
        ),
        subtitle: Text(method.terms1!),
      ),
    );
  }
}

///Corporate payment widget
class CorporatePaymentWidget extends StatelessWidget {
  final PaymentMethod method;
  const CorporatePaymentWidget({Key? key, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 4,
              color: context.watch<SelectedPaymentMethodCubit>().state!.code ==
                      method.code
                  ? Palette.greenColor
                  : Colors.white)),
      child: ListTile(
        onTap: () {
          context.read<SelectedPaymentMethodCubit>().emit(method);
        },
        leading: Icon(
          Icons.corporate_fare,
          color: Palette.orangeColor,
        ),
        title: Text(
          method.title!,
          style: TextStyle(fontSize: 14),
        ),
        subtitle: Text('Corporate payment'),
      ),
    );
  }
}

///Mpesa online payment widget
class MpesaOnlinePaymentWidget extends StatelessWidget {
  final PaymentMethod method;
  const MpesaOnlinePaymentWidget({Key? key, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 4,
              color: context.watch<SelectedPaymentMethodCubit>().state!.code ==
                      method.code
                  ? Palette.greenColor
                  : Colors.white)),
      child: ListTile(
        onTap: () {
          context.read<SelectedPaymentMethodCubit>().emit(method);
        },
        leading: Icon(
          Icons.money,
          color: Palette.orangeColor,
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/mpesa.png',
              height: 50,
            ),
            // SvgPicture.asset(
            //   'assets/svgs/mpesa_logo.svg',
            //   height: 50,
            // ),
            Expanded(child: Container())
          ],
        ),
        subtitle: Text('${method.title!} (Pay now)'),
      ),
    );
  }
}

///Mpesa on delivery payment widget
class MpesaOnDeliveryPaymentWidget extends StatelessWidget {
  final PaymentMethod method;
  const MpesaOnDeliveryPaymentWidget({Key? key, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 4,
              color: context.watch<SelectedPaymentMethodCubit>().state!.code ==
                      method.code
                  ? Palette.greenColor
                  : Colors.white)),
      child: ListTile(
        onTap: () {
          context.read<SelectedPaymentMethodCubit>().emit(method);
        },
        leading: Icon(
          Icons.money,
          color: Palette.orangeColor,
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/mpesa.png',
              height: 50,
            ),
            Expanded(child: Container())
          ],
        ),
        subtitle: Text('${method.title!} (Pay later)'),
      ),
    );
  }
}

class MpesaOnDeliveryTab extends StatelessWidget {
  final String label;
  final bool active;
  const MpesaOnDeliveryTab(
      {Key? key, required this.label, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: active ? Palette.greenColor : Colors.white)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          SvgPicture.asset(
            'assets/svgs/mpesa_logo.svg',
            height: 150,
          ),
          SizedBox(
            height: 12,
          ),
          Text('Please pay amount to the delivery executive.')
        ],
      ),
    );
  }
}

class CorporateTab extends StatelessWidget {
  final String label;
  const CorporateTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Palette.greenColor)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          Center(
            child: SvgPicture.asset(
              'assets/svgs/corporate_account.svg',
              height: 150,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text('Please pay via M-Pesa to the delivery executive.')
        ],
      ),
    );
  }
}

class HybridTypeCubit extends Cubit<String> {
  HybridTypeCubit() : super('mpesa');
}

class HybridSelectedCubit extends Cubit<bool> {
  HybridSelectedCubit() : super(false);
  toggle() {
    emit(!state);
  }
}
