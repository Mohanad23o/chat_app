import 'package:chat_app_c11/core/utils/app_strings.dart';

class AppValidators {
  static String? validateEmail({required String? val}) {
    if (val == null || val.trim().isEmpty) {
      return AppStrings.emptyFieldErrorMsg;
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
    if (!emailValid) {
      return AppStrings.notValidateFieldErrorMsg;
    }
    return null;
  }
}
