import 'dart:math';
import 'dart:async';

String generatePassword(
  bool _isWithLetters,
  bool _isWithUppercase,
  bool _isWithNumbers,
  bool _isWithSpecial,
  double _numberCharPassword,
) {
  String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String _numbers = "0123456789";
  String _special = "@#=+!£\$%&?[](){}";

  String _allowedChars = "";
  String result;

  _allowedChars += (_isWithLetters ? _lowerCaseLetters : '');
  _allowedChars += (_isWithUppercase ? _upperCaseLetters : '');
  _allowedChars += (_isWithNumbers ? _numbers : '');
  _allowedChars += (_isWithSpecial ? _special : '');

  for (int i = 0; i < _numberCharPassword.round(); i++) {
    int randomInt = Random.secure().nextInt(_allowedChars.length);
    result += _allowedChars[randomInt];
  }
  return result;
}
