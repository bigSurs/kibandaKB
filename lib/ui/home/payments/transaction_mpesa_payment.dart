import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/cubit/transactional_payment/transactional_payment_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';

class TransactionalMpesaPage extends StatelessWidget {
  final int orderId;

  const TransactionalMpesaPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormBuilderState>();
    var controller = TextEditingController();
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
                  Image.asset(
                    'assets/mpesa.png',
                    height: 200,
                  ),
                  // SvgPicture.asset(
                  //   'assets/svgs/mpesa_logo.svg',
                  //   height: 200,
                  // ),
                  const SizedBox(
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
                    controller: controller,
                    countryFilterByIsoCode: const ['KE'],
                    decoration: const InputDecoration(
                        labelText: 'Enter your phone number',
                        hintText: '712345678',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.greenColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.greenColor)),
                        contentPadding: EdgeInsets.only(left: 12)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<TransactionalPaymentCubit,
                      TransactionalPaymentState>(
                    listener: (context, state) {
                      // TODO: implement listener
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
                            AutoRouter.of(context).replace(TransactionRoute(
                              orderData: {},
                            ));
                          },
                          failed: (e) {
                            AppToast.showToast(message: e, isError: true);
                          });
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        requesting: () {
                          return const CupertinoActivityIndicator(
                            color: Palette.greenColor,
                          );
                        },
                        confirming: () {
                          return const CupertinoActivityIndicator(
                            color: Palette.greenColor,
                          );
                        },
                        requested: () {
                          return CupertinoButton(
                              child: Text('Confirm payment'),
                              color: Palette.orangeColor,
                              onPressed: () {
                                context
                                    .read<TransactionalPaymentCubit>()
                                    .confirmTransacionalPrompts({},
                                        orderId: orderId,
                                        phoneNumber: controller.text);
                              });
                        },
                        orElse: () {
                          return CupertinoButton(
                              color: Palette.orangeColor,
                              onPressed: () async {
                                if (formKey.currentState!.saveAndValidate()) {
                                  context
                                      .read<TransactionalPaymentCubit>()
                                      .makeTransactionalPrompts(
                                          orderId: orderId,
                                          phoneNumber: controller.text);
                                }
                              },
                              child: const Text('Lipa na MPesa'));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
