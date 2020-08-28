enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  phoneAlreadyExist,
  weakPassword,
  kosong,
}

class AuthExceptionHandler {
  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "weak-password":
        status = AuthResultStatus.weakPassword;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "phone-number-already-exists":
        status = AuthResultStatus.phoneAlreadyExist;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "invalid-credential":
        status = AuthResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-exists":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Email yang anda masukan salah";
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = "Password harus 6+ karakter ";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Password yang anda masukan salah";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "Id user tersebut tidak ada";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "Id user tersebut sudah dinonaktifkan";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage =
            "Terlalu banyak permintaan, silahkan tutup dan buka kembali aplikasi";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage =
            "Khusus untuk anda login menggunakan email dan password tidak diperbolehkan";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "Email sudah teregistrasi, silahkan login menggunakan email atau klik lupa password";
        break;
      case AuthResultStatus.phoneAlreadyExist:
        errorMessage =
            "No HP sudah teregistrasi, silahkan login menggunakan no HP atau klik ganti no HP";
        break;
      default:
        errorMessage = "Login/registrasi error";
    }

    return errorMessage;
  }
}
