import 'package:chat_app_c11/core/utils/app_strings.dart';
import 'package:chat_app_c11/core/utils/color_manager.dart';
import 'package:chat_app_c11/core/utils/font_manager.dart';
import 'package:chat_app_c11/core/utils/image_constants.dart';
import 'package:chat_app_c11/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Container(
            color: ColorManager.white,
          ),
          Image.asset(
            ImageConstants.mainBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              leading: const ImageIcon(
                AssetImage(IconAssets.icMenu),
                color: ColorManager.white,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: const ImageIcon(
                    AssetImage(IconAssets.icSearch),
                    color: ColorManager.white,
                  ),
                )
              ],
              centerTitle: true,
              title: Text(
                AppStrings.appName,
                style: getBoldStyle(
                    color: ColorManager.white, fontSize: FontSize.s21.sp),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.h),
                child: TabBar(
                  indicatorColor: ColorManager.white,
                  labelColor: ColorManager.white,
                  dividerColor: ColorManager.transparent,
                  unselectedLabelColor: Colors.white70,
                  indicatorWeight: .5,
                  labelStyle: getBoldStyle(
                    fontSize: FontSize.s16.sp,
                    color: ColorManager.primary,
                  ),
                  tabs: const [
                    Tab(text: 'My Rooms'),
                    Tab(text: 'Browse'),
                  ],
                ),
              ),
            ),
            backgroundColor: ColorManager.transparent,
            body: TabBarView(
              children: [
                Center(
                  child: Text(
                    "No rooms joined yet",
                    style: getRegularStyle(
                        color: Colors.grey, fontSize: FontSize.s14.sp),
                  ),
                ),
                Center(
                  child: Text(
                    "Browse rooms here",
                    style: getRegularStyle(
                        color: Colors.grey, fontSize: FontSize.s14.sp),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r)),
              onPressed: () {},
              backgroundColor: ColorManager.primary,
              child: Icon(
                Icons.add,
                color: ColorManager.white,
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
