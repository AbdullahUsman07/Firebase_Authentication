import 'package:firebase_practice/extensions/stringextension.dart';
import 'package:firebase_practice/validation/validationModel.dart';

class CheckValidation {
  Validation email = Validation(null, null);
  Validation username = Validation(null, null);
  Validation password = Validation(null, null);
  Validation recheck = Validation(null, null);

  bool get isValidLogin =>
      email.value != null &&
      password.value != null ;


  bool get isValidRegister => email.value != null && password.value != null && username.value != null && recheck.value == password.value;
    

  validateEmail(String value) {
    // if(value == null){
    //   return;
    // }

    if (value.isvalidEmail) {
      email.value = value;
      email.error = null;
    } else {
      email.error = "enter valid email address";
      email.value = null;
    }
  }

  validatePassword(String value) {
    if (value.isvalidPassword) {
      password.value = value;
      password.error = null;
    } else {
      password.error = "must be 8 characters long";
      password.value = null;
    }
  }

  validateUserName(String value) {
    if (value.isValidUsername) {
      username.value = value;
      username.error = null;
    } else {
      username.error = "special characters not allowed";
      password.value = null;
    }
  }

  validateRecheck(String value) {
    if (password.value == value) {
      recheck.value = value;
      recheck.error = null;
    } else {
      recheck.error = "password doesn't match";
      recheck.value = null;
    }
  }
}
