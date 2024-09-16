import 'package:chat_app_c11/core/components/build_text_form_field.dart';
import 'package:chat_app_c11/core/components/general_icon_button.dart';
import 'package:chat_app_c11/core/utils/app_strings.dart';
import 'package:chat_app_c11/core/utils/color_manager.dart';
import 'package:chat_app_c11/core/utils/font_manager.dart';
import 'package:chat_app_c11/core/utils/image_constants.dart';
import 'package:chat_app_c11/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: ColorManager.white,
            child: Image.asset(
              ImageConstants.mainBg,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(
          backgroundColor: ColorManager.transparent,
          appBar: AppBar(
            leading: SizedBox(),
            backgroundColor: ColorManager.transparent,
            elevation: 0,
            toolbarHeight: 85.h,
            centerTitle: true,
            title: Text(
              AppStrings.login,
              style: getBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s20.sp),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180.h,
                ),
                Text(
                  AppStrings.welcome,
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s24.sp),
                ),
                SizedBox(
                  height: 30.h,
                ),
                BuildTextFormField(
                  labelText: AppStrings.email,
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                BuildTextFormField(
                  controller: TextEditingController(),
                  labelText: AppStrings.password,
                ),
                SizedBox(
                  height: 46.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot password?',
                    style: getRegularStyle(
                      color: ColorManager.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                GeneralIconButton(
                  iconText: AppStrings.login,
                ),
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or',
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        ' Create Account',
                        style: getSemiBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
