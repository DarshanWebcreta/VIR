class Validation {
  Validation._();
  static final RegExp addDigitOnly =
  RegExp(r'^\d*\.?\d*$');

  static final RegExp _phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
  static String? pass(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static String? barcode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter any value';
    }
    return null;
  }
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

}
