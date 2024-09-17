import 'package:chat_app_c11/core/utils/color_manager.dart';
import 'package:chat_app_c11/core/utils/font_manager.dart';
import 'package:chat_app_c11/core/utils/style_manager.dart';
import 'package:chat_app_c11/core/utils/type_def_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_btn/loading_btn.dart';

class GeneralIconButton extends StatelessWidget {
  String leadingTitle;
  VoidCallback onTap;

  GeneralIconButton({required this.leadingTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      roundLoadingShape: false,
      height: 68.h,
      animationDuration: Duration(milliseconds: 200),
      // padding: EdgeInsets.all(20.sp),
      borderRadius: 15.r,
      width: 50.w,
      animate: true,
      onTap: ((startLoading, stopLoading, btnState) async {
        if (btnState == ButtonState.idle) {
          startLoading();
          onTap();
          stopLoading();
        }
      }),
      color: ColorManager.primary,
      loader: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading...   ',
            style: getMediumStyle(
                color: ColorManager.white, fontSize: FontSize.s16.sp),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leadingTitle,
              style: getSemiBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s16.sp),
            ),
            Icon(
              CupertinoIcons.arrow_right,
              size: 25.sp,
              color: ColorManager.white,
            )
          ],
        ),
      ),
    );
  }
}
