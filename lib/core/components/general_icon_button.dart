import 'package:chat_app_c11/core/utils/color_manager.dart';
import 'package:chat_app_c11/core/utils/font_manager.dart';
import 'package:chat_app_c11/core/utils/style_manager.dart';
import 'package:chat_app_c11/core/utils/type_def_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralIconButton extends StatelessWidget {
  String iconText;
  NullableVoidCallBack onTap;

  GeneralIconButton({required this.iconText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(15.r)),
        padding: EdgeInsets.all(20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              iconText,
              style: getSemiBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s16.sp),
            ),
            Icon(
              CupertinoIcons.arrow_right,
              size: 25.sp,
              color: ColorManager.white,
              weight: 600,
            )
          ],
        ),
      ),
    );
  }
}
