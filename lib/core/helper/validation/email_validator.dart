validateEmail(String? email) {
  if (email!.isEmpty) {
    return 'ادخل البريد الالكتروني';
  } else {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      return null;
    } else {
      return "لا يمكن تارك الايميل فارغ";
    }
  }
}
