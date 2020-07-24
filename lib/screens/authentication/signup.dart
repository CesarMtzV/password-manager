// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:password_manager/screens/authentication/auth.dart';
// import 'package:password_manager/screens/authentication/signIn.dart';
// import 'package:password_manager/utilities/styles.dart';
// import 'package:password_manager/widgets/rounded_button.dart';

// class Signup extends StatefulWidget {
//   Signup({Key key}) : super(key: key);

//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final _formKey = GlobalKey<FormState>();
//   bool _autoValidate = false;
//   final AuthService _auth = AuthService();
//   String _firstName, _lastName, _email, _password;
//   String error = '';

//   _submit() async {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       dynamic result =
//           await _auth.registerWithEmailAndPassword(_email, _password);
//       if (result == null) {
//         setState(() {
//           error = 'Please enter a valid email';
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Rune"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//               child: Text(
//                 "Create account",
//                 style: TextStyle(fontSize: 40.0),
//               ),
//             ),
//             Form(
//               key: _formKey,
//               autovalidate: _autoValidate,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                     child: TextFormField(
//                       decoration: InputDecoration(labelText: 'First Name'),
//                       onSaved: (input) => _firstName = input,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                     child: TextFormField(
//                       decoration: InputDecoration(labelText: 'Last Name'),
//                       onSaved: (input) => _lastName = input,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                     child: TextFormField(
//                       decoration: InputDecoration(labelText: 'Email'),
//                       validator: (input) => !input.contains('@')
//                           ? 'Please enter a valid email'
//                           : null,
//                       onSaved: (input) => _lastName = input,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                     child: TextFormField(
//                       decoration: InputDecoration(labelText: 'Password'),
//                       validator: (input) => input.length < 6
//                           ? 'Password must be at least 6 characters'
//                           : null,
//                       obscureText: true,
//                       onSaved: (input) => _lastName = input,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     error,
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   RoundedButton(
//                     onPress: _submit,
//                     color: kPrimaryColor,
//                     text: 'Create account',
//                     textColor: Colors.white,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text('Already have an account? '),
//                       GestureDetector(
//                         child: Text(
//                           "Sign in",
//                           style: TextStyle(color: Colors.redAccent),
//                         ),
//                         onTap: () {
//                           Navigator.pop(context);
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Login()));
//                         },
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
