abstract class Exceptions {}

class FireBaseExceptions extends Exceptions {
  static const String fireAuthManyRequest =
      '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.';
  static const String fireAuthNoAccountFounded =
      '[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.';
  static const String fireAuthEmailInUse =
      '[firebase_auth/email-already-in-use] The email address is already in use by another account.';
}

class InternetExceptions extends Exceptions {
  static const String serverError = 'Server Error';
  static const String noInternet = 'No Internet Connection';
}
