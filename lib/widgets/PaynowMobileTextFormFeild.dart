import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kibanda_kb/app/theme/app_theme.dart';
import 'package:kibanda_kb/constants/constants.dart';
import 'package:kibanda_kb/widgets/size_config.dart';


class PaynowMobileTextFormField extends StatelessWidget {
  final String? label;
  final int? maxlength;
  final bool? autovalidateMode;
  final String? hintText;
  final String? error;
  final String? serverError;
  final TextEditingController? controller;
  final Function? validationFunction;
  final String? helperText;
  final TextInputType? keyboardType;
  final bool? density;
  final bool? autofocus;
  final bool? obscureText;
  final List<TextInputFormatter>? inptuFormatters;
  final bool? readOnly;
  final bool? enable;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final Color? colour;
  final Color? hintColor;

  const PaynowMobileTextFormField({
    this.label,
    this.autovalidateMode,
    this.maxlength,
    this.hintText,
    this.controller,
    this.validationFunction,
    this.error,
    this.hintColor,
    this.serverError,
    this.keyboardType,
    this.helperText,
    this.density = true,
    this.autofocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.enable = true,
    this.inptuFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.colour,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(60),
      // width: getProportionateScreenWidth(60),
      child: TextFormField(
        maxLength: this.maxlength,
        enabled: this.enable,
        autofocus: this.autofocus!,
        inputFormatters: this.inptuFormatters,
        cursorColor: AppTheme.colorGrey,
        obscureText: this.obscureText!,
        readOnly: this.readOnly!,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: this.label,
          errorText: this.serverError,
          hintText: this.hintText,
          fillColor: colour,
          filled: true,

          hintStyle: TextStyle(color: hintColor),
          helperText: helperText,

          errorStyle: TextStyle(height: 0.8, fontSize: 12),
          helperStyle: TextStyle(height: 0.8),
          prefixIcon: this.prefixIcon,
          suffixIcon: this.suffixIcon,
          suffixIconConstraints: BoxConstraints(minWidth: 36),
          prefixIconConstraints: BoxConstraints(minWidth: 36),
          // contentPadding: this.padding,
          isDense: this.density,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
            borderRadius: BorderRadius.circular(Constants.border_radius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.errorColor,
            ),
            borderRadius: BorderRadius.circular(Constants.border_radius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.errorColor,
            ),
            borderRadius: BorderRadius.circular(Constants.border_radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
            borderRadius: BorderRadius.circular(Constants.border_radius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
            borderRadius: BorderRadius.circular(Constants.border_radius),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return this.error;
          }
          if (this.validationFunction != null) {
            return this.validationFunction!(val);
          }
          return null;
        },
        controller: this.controller,
        keyboardType: this.keyboardType,
        textInputAction: TextInputAction.next,
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
