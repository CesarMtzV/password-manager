import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:password_manager/models/account.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> saveProduct(Account account) {
    return _db
        .collection('accounts')
        .document(account.accountID)
        .setData(account.toMap());
  }

  //Getter for all products from firebase
  Stream<List<Account>> getAccounts() {
    /* 
      1. We take the collection of our accounts
      2. We get the snapshots from the data of that collection
      3. We map them into a snaphot object
      4. We get the document objects that are on the snapshot object
      5. We map the document objects
      6. We collect the data from that document
      7. We pass it to our model
      8. We create a dart object from it
    */
    return _db.collection('accounts').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Account.fromFirestore(document.data))
        .toList());
  }

  Future<void> removeAccount(String accountID) {
    return _db.collection('accounts').document(accountID).delete();
  }
}
