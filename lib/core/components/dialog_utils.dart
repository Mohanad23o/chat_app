import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';
import '../utils/font_manager.dart';
import '../utils/style_manager.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String massage}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(massage),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMassage(
      {required BuildContext context,
      required String content,
      String title = '',
      String? posActionName,
      Function? posAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              content,
              style: getMediumStyle(
                  color: ColorManager.black, fontSize: FontSize.s16.sp),
            ),
            title: Text(title),
            actions: actions,
          );
        });
  }
}
