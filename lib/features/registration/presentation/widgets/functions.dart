bool isEmailValid(String email) {
  const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

bool isPhoneValid(String phone) {
  const pattern = r'^0[567]{1}\d{8}$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(phone);
}
bool isPasswordValid(String password) {
  // Check if the password meets the minimum length requirement
  if (password.length < 6) {
    return false;
  }

  // Check if the password contains at least one letter
  if (!password.contains(RegExp(r'[a-z]', caseSensitive: false))) {
    return false;
  }
  
  // // Check if the password contains at least one lowercase letter
  // if (!password.contains(RegExp(r'[a-z]'))) {
  //   return false;
  // }
  //
  // // Check if the password contains at least one digit
  // if (!password.contains(RegExp(r'[0-9]'))) {
  //   return false;
  // }

  // Check if the password contains at least one special character
  // if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //   return false;
  // }

  return true;
}
bool isNameValid(String name) {
  // Check if the name is empty
  if (name.isEmpty) {
    return false;
  }

  // Check if the name has a minimum length of 2 characters and a maximum length of 50 characters
  if (name.length < 3 || name.length >15) {
    return false;
  }

  // Check if the name contains only alphabetic characters

  // Define a list of restricted words or characters
  List<String> restrictedWords = ['admin', 'root', 'password'];

  // Check if the name contains any restricted words or characters
  for (String restrictedWord in restrictedWords) {
    if (name.toLowerCase().contains(restrictedWord)) {
      return false;
    }
  }

  // Add additional checks or constraints as needed

  return true;
}

bool isIndentifierValid(String indentifier) => isEmailValid(indentifier) || isNameValid(indentifier) || isPhoneValid(indentifier);