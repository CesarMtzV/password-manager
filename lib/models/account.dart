class Account {
  final String accountID;
  final String email;
  final String userName;
  final String password;
  final String url;
  final String siteName;

  Account({
    this.accountID,
    this.email,
    this.userName,
    this.password,
    this.url,
    this.siteName,
  });

  //Turn object into a map
  Map<String, dynamic> toMap() {
    return {
      'accountID': accountID,
      'email': email,
      'userName': userName,
      'password': password,
      'url': url,
      'siteName': siteName
    };
  }

  //Turn a map into an object
  Account.fromFirestore(Map<String, dynamic> firestore)
      : accountID = firestore['accountID'],
        email = firestore['email'],
        userName = firestore['userName'],
        password = firestore['password'],
        url = firestore['url'],
        siteName = firestore['siteName'];
}
