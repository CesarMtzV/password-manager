import 'package:flutter/material.dart';
import 'package:password_manager/providers/account_provider.dart';
import 'package:password_manager/screens/authentication/login_register.dart';
import 'package:password_manager/screens/main/vault.dart';
import 'package:password_manager/services/firestore_service.dart';
import 'package:password_manager/utilities/styles.dart';
import 'screens/authentication/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Rune());
}

class Rune extends StatefulWidget {
  @override
  _RuneState createState() => _RuneState();
}

class _RuneState extends State<Rune> {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        StreamProvider(create: (context) => firestoreService.getAccounts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return Vault();
            }
            return LoginOrRegister();
          },
        ),
      ),
    );
  }
}
