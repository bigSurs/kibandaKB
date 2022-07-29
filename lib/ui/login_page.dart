import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kibanda_kb/authentication/token_cubit.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/login_cubit/login_cubit.dart';
import 'package:kibanda_kb/cubits/op_selection_cubit/op_selection_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
      duration: const Duration(seconds: 1),
      // ignore: sort_child_properties_last
      child: Center(
        child: LoginCard(),
      ),
      decoration: const BoxDecoration(color: Palette.orangeColor
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Palette.greenColor, Palette.orangeColor]
          //     )
          ),
    ));
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    Key? key,
  }) : super(key: key);

  static var _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text.rich(TextSpan(
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
                // ignore: todo
                //TODO: dropdown
                // DropdownButton(items: items, onChanged: onChanged)
                const SizedBox(
                  height: 40,
                ),
                FormBuilderTextField(
                  name: 'email',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  decoration: InputDecoration(
                    hintText: 'email',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  name: 'password',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  // obscureText: context.watch<ObscurePasswordCubit>().state,
                  decoration: InputDecoration(
                    suffixIcon: CupertinoButton(
                      padding: const EdgeInsets.all(0.0), onPressed: () {},
                      child: Text(''),
                      // child: Icon(!context.watch<ObscurePasswordCubit>().state
                      //     ? CupertinoIcons.lock_open
                      //     : CupertinoIcons.lock),
                      // onPressed: () {
                      //   context.read<ObscurePasswordCubit>().toggle();
                      // }
                    ),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // CupertinoButton(
                //     child: const Text('Login'),
                //     color: Palette.greenColor,
                //     onPressed: () {
                //       //TODO:UNCOMMENT THE LOGIN SIGN UP LOGIC
                //       // AutoRouter.of(context).replace(const MainHomeRoute());
                //       if (_formKey.currentState!.saveAndValidate()) {
                //         context
                //             .read<LoginCubit>()
                //             .login(data: _formKey.currentState!.value);
                //       }
                //     }),
                // ListTile(
                //   title: const Text('Order processing'),
                //   onTap: () {
                //     context.read<OPSelectionCubit>().save(true);
                //   },
                //   leading: CupertinoSwitch(
                //     value: context.watch<OPSelectionCubit>().state,
                //     onChanged: (val) {
                //       context.read<OPSelectionCubit>().toggle();
                //     },
                //   ),
                // ),
                // ListTile(
                //   title: const Text('Delivery executive'),
                //   onTap: () {
                //     context.read<OPSelectionCubit>().save(false);
                //   },
                //   leading: CupertinoSwitch(
                //     value: !context.watch<OPSelectionCubit>().state,
                //     onChanged: (val) {
                //       context.read<OPSelectionCubit>().toggle();
                //     },
                //   ),
                // ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) async {
                    if (state is LoginSuccess) {
                      await AppToast.showToast(
                          message: 'Login successful', isError: false);
                      context
                          .read<TokenCubit>()
                          .saveToken(state.loginResponse.token!);
                      AutoRouter.of(context).replace(const MainHomeRoute());
                    }
                    if (state is LoginFailed) {
                      AppToast.showToast(message: state.error, isError: true);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const SpinKitHourGlass(color: Palette.greenColor);
                    }
                    return CupertinoButton(
                        child: Text('Login'),
                        color: Palette.greenColor,
                        onPressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            context
                                .read<LoginCubit>()
                                .login(data: _formKey.currentState!.value);
                          }
                        });
                  },
                ),

                CupertinoButton(
                    child: const Text('Forgot password?'),
                    onPressed: () {
                      // AutoRouter.of(context).push(const ResetPasswordRoute());
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
