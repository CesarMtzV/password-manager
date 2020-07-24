import 'package:flutter/material.dart';
import 'package:password_manager/screens/authentication/login_register.dart';
import 'package:password_manager/screens/authentication/signIn.dart';
import 'package:password_manager/utilities/styles.dart';
import 'package:password_manager/widgets/rounded_button.dart';
import 'signup.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Rune",
                  style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Welcome to Rune. Let's get started.",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RoundedButton(
              text: "START",
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginOrRegister()));
              },
              color: kPrimaryColorDark,
              textColor: Colors.white,
            ),
            // RoundedButton(
            //   text: "SIGN UP",
            //   onPress: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Signup()));
            //   },
            //   color: kPrimaryColor,
            //   textColor: Colors.white,
            // )
          ],
        ),
      ),
    );
  }
}
