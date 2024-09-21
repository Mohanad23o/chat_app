import 'dart:async';

import 'package:chat_app_c11/config/routes/routes.dart';
import 'package:chat_app_c11/core/components/build_text_form_field.dart';
import 'package:chat_app_c11/core/components/dialog_utils.dart';
import 'package:chat_app_c11/core/di/di.dart';
import 'package:chat_app_c11/core/errors/exceptions.dart';
import 'package:chat_app_c11/core/utils/app_strings.dart';
import 'package:chat_app_c11/core/utils/app_validators.dart';
import 'package:chat_app_c11/core/utils/color_manager.dart';
import 'package:chat_app_c11/core/utils/font_manager.dart';
import 'package:chat_app_c11/core/utils/image_constants.dart';
import 'package:chat_app_c11/core/utils/style_manager.dart';
import 'package:chat_app_c11/features/login/presentation/manager/cubit/login_screen_view_model.dart';
import 'package:chat_app_c11/features/register/presentation/manager/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_btn/loading_btn.dart';

class LoginScreen extends StatelessWidget {
  LoginScreenViewModel viewModel = getIt<LoginScreenViewModel>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          print('success');
          DialogUtils.showMassage(
              context: context,
              content: AppStrings.loginSuccessfully,
              title: 'Success',
              posActionName: 'Ok',
              posAction: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, Routes.homeScreen);
              });
        }
        if (state is LoginErrorState) {
          DialogUtils.showMassage(
            context: context,
            content: state.errorMessage ==
                    FireBaseExceptions.fireAuthNoAccountFounded
                ? AppStrings.emailOrPasswordWrong
                : state.errorMessage,
            title: 'Error',
            posActionName: 'Ok',
          );
        }
      },
      child: Form(
        key: viewModel.formKey,
        child: Stack(
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
                leading: const SizedBox(),
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
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BuildTextFormField(
                            labelText: AppStrings.email,
                            controller: viewModel.emailController,
                            validator: (val) {
                              return AppValidators.validateEmail(val: val);
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          BuildTextFormField(
                            obscureText: true,
                            controller: viewModel.passwordController,
                            labelText: AppStrings.password,
                            validator: (val) {
                              return AppValidators.validatePassword(val: val);
                            },
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
                          LoadingBtn(
                            roundLoadingShape: false,
                            height: 68.h,
                            animationDuration:
                                const Duration(milliseconds: 200),
                            borderRadius: 15.r,
                            width: 50.w,
                            animate: true,
                            onTap:
                                ((startLoading, stopLoading, btnState) async {
                              if (btnState == ButtonState.idle) {
                                if (viewModel.formKey.currentState!
                                    .validate()) {
                                  viewModel.login();
                                  startLoading();
                                  Timer(const Duration(seconds: 2),
                                      () => stopLoading());
                                }
                              }
                            }),
                            color: ColorManager.primary,
                            loader: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Loading...   ',
                                  style: getMediumStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s16.sp),
                                ),
                                LoadingAnimationWidget.discreteCircle(
                                    color: ColorManager.white,
                                    size: 23.sp,
                                    thirdRingColor: ColorManager.black,
                                    secondRingColor: Colors.red),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.login,
                                    style: getSemiBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s16.sp),
                                  ),
                                  Icon(
                                    CupertinoIcons.arrow_right,
                                    size: 25.sp,
                                    color: ColorManager.white,
                                  )
                                ],
                              ),
                            ),
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
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14.sp),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.signUp);
                                },
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
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*

 */
