import 'package:flutter/material.dart';
import 'package:password_manager/models/account.dart';
import 'package:password_manager/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class AccountProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  var uuid = Uuid();

  String _accountID;
  String _email;
  String _userName;
  String _password;
  String _url;
  String _siteName;

  //Getters
  String get email => _email;
  String get userName => _userName;
  String get password => _password;
  String get url => _url;
  String get siteName => _siteName;

  //Setters
  setEmail(String input) {
    _email = input;
    notifyListeners();
  }

  setUserName(String input) {
    _userName = input;
    notifyListeners();
  }

  setPassword(String input) {
    _password = input;
    notifyListeners();
  }

  setURL(String input) {
    _url = input;
    notifyListeners();
  }

  setSiteName(String input) {
    _siteName = input;
    notifyListeners();
  }

  //Functions
  saveProduct() {
    if (_accountID == null) {
      var newAccount = Account(
        email: email,
        userName: userName,
        password: password,
        url: url,
        siteName: siteName,
        accountID: uuid.v4(),
      );
      firestoreService.saveProduct(newAccount);
    } else {
      //Update existing account
      var updateAccount = Account(
        email: email,
        userName: userName,
        password: password,
        url: url,
        siteName: siteName,
        accountID: _accountID,
      );
      firestoreService.saveProduct(updateAccount);
    }
  }

  removeAccount(String accountID) {
    firestoreService.removeAccount(accountID);
  }

  loadValues(Account account) {
    _email = account.email;
    _userName = account.userName;
    _password = account.password;
    _siteName = account.siteName;
    _url = account.url;
    _accountID = account.accountID;
  }
}
