import 'package:chat_app_c11/core/utils/app_strings.dart';

class AppValidators {
  static String? validateEmail({required String? val}) {
    if (val == null || val.trim().isEmpty) {
      return AppStrings.emptyFieldErrorMsg;
    }
    final bool emailValid =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(val);
    if (!emailValid) {
      return AppStrings.notValidateFieldErrorMsg;
    }
    return null;
  }

  static String? validatePassword({required String? val}) {
    if (val?.trim() != null && val!.trim().isNotEmpty) {
      if (val.length < 8) {
        return 'Must be at least 8 characters long';
      }
      if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(val)) {
        return 'Must contain at least one uppercase letter';
      }
      if (!RegExp(r'^(?=.*?[a-z])').hasMatch(val)) {
        return 'Must contain at least one lowercase letter';
      }
      if (!RegExp(r'^(?=.*?[0-9])').hasMatch(val)) {
        return 'Must contain at least one digit';
      }
      if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(val)) {
        return 'Must contain at least one special character';
      }
      return null;
    } else {
      return AppStrings.emptyFieldErrorMsg;
    }
  }

  static String? validateUsername({required String? val}) {
    val = val?.trim();
    if (val == null || val.trim().isEmpty) {
      return AppStrings.emptyFieldErrorMsg;
    }
    if (val.length < 3 || val.length > 16) {
      return 'Username must be between 3 and 16 characters long.';
    }

    RegExp allowedCharacters = RegExp(r'^[a-zA-Z0-9._]+$');
    if (!allowedCharacters.hasMatch(val)) {
      return 'Username can only contain letters, numbers, underscores, and periods.';
    }

    if (val.startsWith('_') ||
        val.startsWith('.') ||
        val.endsWith('_') ||
        val.endsWith('.')) {
      return 'Username cannot start or end with an underscore or period.';
    }

    RegExp consecutiveSymbols = RegExp(r'[_.]{2}');
    if (consecutiveSymbols.hasMatch(val)) {
      return 'Username cannot have consecutive underscores or periods.';
    }

    // If all checks pass, the val (username) is valid
    return null;
  }
}
