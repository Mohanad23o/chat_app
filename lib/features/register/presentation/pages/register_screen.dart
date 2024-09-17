import 'dart:async';

import 'package:chat_app_c11/core/cache/shared_preferences_utils.dart';
import 'package:chat_app_c11/core/components/dialog_utils.dart';
import 'package:chat_app_c11/core/di/di.dart';
import 'package:chat_app_c11/core/errors/exceptions.dart';
import 'package:chat_app_c11/features/register/data/data_sources/remote_data_source/impl/register_remote_data_source_impl.dart';
import 'package:chat_app_c11/features/register/data/data_sources/remote_data_source/register_remote_data_source.dart';
import 'package:chat_app_c11/features/register/data/repositories/register_repository_impl.dart';
import 'package:chat_app_c11/features/register/domain/repositories/register_repository.dart';
import 'package:chat_app_c11/features/register/domain/use_cases/register_use_case.dart';
import 'package:chat_app_c11/features/register/presentation/manager/cubit/register_screen_view_model.dart';
import 'package:chat_app_c11/features/register/presentation/manager/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/components/build_text_form_field.dart';
import '../../../../core/components/general_icon_button.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/image_constants.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../login/presentation/manager/cubit/login_state.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  RegisterScreenViewModel viewModel = getIt<RegisterScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          print('success');
          DialogUtils.showMassage(
              context: context,
              content: AppStrings.createdAccountSuccessfully,
              title: 'Success',
              posActionName: 'Ok',
              posAction: () {
                Navigator.pop(context);
              });
        }

        if (state is RegisterErrorState) {
          DialogUtils.showMassage(
              context: context,
              content:
                  state.errorMessage == FireBaseExceptions.fireAuthEmailInUse
                      ? AppStrings.emailAlreadyInUse
                      : state.errorMessage
              // SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       Lottie.asset(LottieConstants.errorAnimation,
              //           width: 85.w,
              //           height: 85.h,
              //           animate: true,
              //           repeat: true,
              //           frameRate: FrameRate(60)),
              //       SizedBox(
              //         height: 20.h,
              //       ),
              //       SingleChildScrollView(
              //         child: ReadMoreText(state.errorMessage == FireBaseExceptions.fireAuthEmailInUse ?
              //         AppStrings.emailAlreadyInUse :
              //         state.errorMessage,
              //           style: getMediumStyle(
              //               color: ColorManager.black, fontSize: FontSize.s16.sp),
              //           trimLines: 2,
              //           trimMode: TrimMode.Line,
              //           moreStyle: getRegularStyle(color: ColorManager.primary),
              //           lessStyle: getRegularStyle(color: ColorManager.primary),
              //         ),
              //       ),
              //       Text(
              //         state.errorMessage == FireBaseExceptions.fireAuthEmailInUse ?
              //         AppStrings.emailAlreadyInUse :
              //         state.errorMessage,
              //         maxLines: 2,
              //         style: getMediumStyle(
              //             color: ColorManager.black, fontSize: FontSize.s16.sp),
              //       ),
              //     ],
              //   ),
              // ),
              ,
              title: 'Error',
              posActionName: 'Ok');
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
                leading: SizedBox(),
                backgroundColor: ColorManager.transparent,
                elevation: 0,
                toolbarHeight: 85.h,
                centerTitle: true,
                title: Text(
                  AppStrings.createAccount,
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
                    SizedBox(
                      height: 30.h,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BuildTextFormField(
                            labelText: AppStrings.userName,
                            controller: viewModel.userNameController,
                            validator: (val) {
                              return AppValidators.validateUsername(val: val);
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
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
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          LoadingBtn(
                            roundLoadingShape: false,
                            height: 68.h,
                            animationDuration: Duration(milliseconds: 200),
                            // padding: EdgeInsets.all(20.sp),
                            borderRadius: 15.r,
                            width: 50.w,
                            animate: true,
                            onTap:
                                ((startLoading, stopLoading, btnState) async {
                              if (btnState == ButtonState.idle) {
                                if (viewModel.formKey.currentState!
                                    .validate()) {
                                  viewModel.register();
                                  startLoading();
                                  Timer(Duration(seconds: 3),
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
                                    AppStrings.createAccount,
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
                                'Already Have Account ? ',
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14.sp),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  AppStrings.login,
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
