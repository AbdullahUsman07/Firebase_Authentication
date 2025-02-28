

extension StringExtension on String {
  bool get isvalidDebit => RegExp(r'^\d{12}$').hasMatch(this);

  String get formattedDebit {
    return replaceAllMapped(
        RegExp(r'(\d{4})(?=\d)'), (match) => '${match[1]} ');
  }

  bool get isvalidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool get isvalidPassword =>
      RegExp(r'[a-zA-Z0-9!@#$%^&*()]{8}').hasMatch(this);

   bool get isValidUsername => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);


}

