simpleValidator(String s) {
  if (s.isEmpty) return 'Invalid (mandatory *)';
  return null;
}

emailValidator(String s) {
  bool result = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(s);
  if (result == false)
    return 'Invalid (mandatory *)';
  else
    return null;
}

phoneValidator(String s) {
  if (s.length != 10) return 'Invalid (mandatory *)';
  return null;
}

nullValidator(String s) {
  return null;
}

monthValidator(String s) {
  if (s == 'Month') return 'Mendatory';
  return null;
}

yearValidator(String s) {
  if (s.length < 4) return 'Invalid';
  return null;
}
