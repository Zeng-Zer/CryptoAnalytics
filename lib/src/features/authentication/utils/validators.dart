String? emailValidator(String? email) {
  if (email == null) {
    return 'Please fill your email address';
  }

  final isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!isValid) {
    return 'Please enter a valid email address.';
  }

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.length < 8) {
    return 'Password must have at least 8 characters.';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Please enter your name.';
  }
  return null;
}
