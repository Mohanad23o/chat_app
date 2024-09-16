import 'package:chat_app_c11/core/utils/color_manager.dart';
import 'package:chat_app_c11/core/utils/font_manager.dart';
import 'package:chat_app_c11/core/utils/style_manager.dart';
import 'package:chat_app_c11/core/utils/type_def_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextFormField extends StatelessWidget {
  StringVoidCallBack validator;
  String? hintText;
  String? labelText;
  String? helperText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obscureText;
  TextEditingController controller;
  TextInputType? textInputType;

  BuildTextFormField(
      {this.validator,
      required this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.helperText,
      this.hintText,
      this.labelText,
      this.textInputType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // maxLines: 2,
      obscureText: obscureText,
      style: getRegularStyle(
          color: const Color(
            0xff24272B,
          ),
          fontSize: FontSize.s18.sp),
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: getRegularStyle(
            color: ColorManager.grey, fontSize: FontSize.s14.sp),
        enabled: true,
        suffixIcon: suffixIcon,
        helperText: helperText,
        hintFadeDuration: Duration(seconds: 2),
        prefixIcon: prefixIcon,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.error)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary)),
        errorMaxLines: 2,
      ),
    );
  }
}
