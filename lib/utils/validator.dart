class Validator {
  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

//https://stackoverflow.com/questions/16699007/regular-expression-to-match-standard-10-digit-phone-number
  static bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(
            r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
        .hasMatch(phoneNumber);
  }

//https://stackoverflow.com/questions/5142103/regex-to-validate-password-strength
  static bool isValidPassword(String password) {
    return RegExp(r"^(?=.*[A-Z])(?=.*[!@#$&*\/])(?=.*[0-9])(?=.*[a-z]).{6}")
        .hasMatch(password);
  }

  static bool isValidName(String name) {
    return name.length > 2;
  }

  static String? getValidPhoneNumberWithCountryCode(String phone) {
    var editablePhone = phone;

    if (editablePhone[0] == '0') {
      editablePhone = editablePhone.substring(1);
      return "+264$editablePhone";
    } else if (editablePhone.length >= 4 &&
        editablePhone.substring(0, 4) == "+264") {
      return editablePhone;
    } else if (editablePhone.length >= 4 &&
        editablePhone.substring(0, 3) == "264") {
      return "+$editablePhone";
        }else if (editablePhone.length >= 4 &&
        editablePhone.substring(0, 3) == "264") {
      return "%2B$editablePhone";
    } else if (editablePhone[0] == '0') {
      editablePhone = editablePhone.substring(1);
      return "%2B264$editablePhone";
      }else {
      return null;
    }
  }
}
