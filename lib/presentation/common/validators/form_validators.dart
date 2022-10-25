import 'package:string_validator/string_validator.dart';

class FormValidators {
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 8) {
      return "Enter a password containing at least 8 characters";
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!isEmail(value)) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  static String? givenNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your given name';
    } else {
      return null;
    }
  }

  static String? familyNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your family name';
    } else {
      return null;
    }
  }
}
