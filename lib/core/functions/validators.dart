/// Yanlış olduğunda true döner
String? phoneValidator(String value) {
  String regExp =
      r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$";
  if (!(value.length >= 10 && value.contains(RegExp(regExp)))) {
    return 'Lütfen geçerli bir telefon numarası girin';
  }
  return null; //yazılan rakam sayısı 11 den büyükse devam et
}

/// Yanlış olduğunda true döner
String? emailValidator(String value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,400}$";
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'Lütfen geçerli bir email adresi girin';
  }
  return null;
}

/// Yanlış olduğunda true döner
String? isValidName(String value) {
  String pattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return "Lütfen isim ve soyisminiz girin";
  }
  return null;
}

/// Yanlış olduğunda true döner
String? passwordValidator(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'Lütfen geçerli bir şifre girin';
  }
  return null;
}
