import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/cubit/payments/lipa_na_mpesa_cubit/lipa_na_mpesa_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';


import '../../../../cubits/cart/cart_cubit.dart';
import '../../../../cubits/cart/cart_product_metadata_cubit.dart';

class MpesaPaymentPage extends StatelessWidget {
  final String orderReference;
  final Map<String, dynamic> data;
  const MpesaPaymentPage(
      {Key? key, required this.orderReference, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Mpesa Online',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: FormBuilder(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/mpesa_logo.svg',
                    height: 200,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FormBuilderPhoneField(
                    name: 'mpesa_phonenumber',
                    defaultSelectedCountryIsoCode: 'KE',
                    valueTransformer: (val) {
                      return val!.substring(val.length - 9);
                    },
                    priorityListByIsoCode: ['KE'],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.min(9)
                    ]),
                    countryFilterByIsoCode: ['KE'],
                    decoration: InputDecoration(
                        labelText: 'Enter your phone number',
                        hintText: '712345678 or 123456789',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.greenColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.greenColor)),
                        contentPadding: EdgeInsets.only(left: 12)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<LipaNaMpesaCubit, LipaNaMpesaState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          requested: () {
                            AppToast.showToast(
                                message: 'Please wait to enter your pin',
                                isError: false);
                          },
                          confirmed: () {
                            AppToast.showToast(
                                message: 'Payment successful', isError: false);
                            AutoRouter.of(context).replace(OrderSuccessRoute());
                            context.read<CartCubit>().emit([]);
                            context.read<CartProductMetadataCubit>().emit([]);
                          },
                          failed: (e) {
                            AppToast.showToast(message: e, isError: true);
                          });
                    },
                    builder: (context, state) {
                      return state.maybeWhen(requesting: () {
                        return CupertinoActivityIndicator();
                      }, confirming: () {
                        return CupertinoActivityIndicator();
                      }, requested: () {
                        return CupertinoButton(
                            child: Text('Confirm payment'),
                            color: Palette.orangeColor,
                            onPressed: () {
                              context.read<LipaNaMpesaCubit>().confirmMpesa({
                                ...formKey.currentState!.value,
                                'payment_method': 'mPesa Online',
                                'payment_method_code': 'mpesa',
                                'order_reference_number[75]': orderReference,
                              });
                            });
                      }, orElse: () {
                        return CupertinoButton(
                            child: Text('Lipa na MPesa'),
                            color: Palette.orangeColor,
                            onPressed: () async {
                              if (formKey.currentState!.saveAndValidate()) {
                                await context.read<CartCubit>().updateCart();
                                context.read<LipaNaMpesaCubit>().lipaNaMpesa({
                                  ...formKey.currentState!.value,
                                  'payment_method': 'mPesa Online',
                                  'payment_method_code': 'mpesa',
                                  'order_reference_number[75]': orderReference,
                                });
                              }
                            });
                      });
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
