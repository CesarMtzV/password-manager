import 'package:flutter/material.dart';
import 'package:password_manager/services/password_generator.dart';
import 'package:password_manager/utilities/styles.dart';

class GeneratePassword extends StatefulWidget {
  @override
  _GeneratePasswordState createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  bool isWithLetters = true;
  bool isWithUppercase = true;
  bool isWithNumbers = true;
  bool isWithSpecial = true;
  double numberCharPassword = 10;
  String newPass = "newPassword";

  @override
  void initState() {
    super.initState();
  }

  lowerCaseButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Lower case letters (a-z)",
            style: kFormInput,
          ),
          Switch(
            onChanged: (bool input) {
              setState(() {
                this.isWithLetters = input;
              });
            },
            value: this.isWithLetters,
          )
        ],
      ),
    );
  }

  upperCaseButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Upper case letters (A-Z)",
            style: kFormInput,
          ),
          Switch(
            onChanged: (bool input) {
              setState(() {
                this.isWithUppercase = input;
              });
            },
            value: this.isWithUppercase,
          )
        ],
      ),
    );
  }

  numbersButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Numbers (0-9)",
            style: kFormInput,
          ),
          Switch(
            onChanged: (bool input) {
              setState(() {
                this.isWithNumbers = input;
              });
            },
            value: this.isWithNumbers,
          )
        ],
      ),
    );
  }

  specialCharactersButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Special Characters (!@#)",
            style: kFormInput,
          ),
          Switch(
            onChanged: (bool input) {
              setState(() {
                this.isWithSpecial = input;
              });
            },
            value: this.isWithSpecial,
          )
        ],
      ),
    );
  }

  numberSlider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Length: ${numberCharPassword.round()}",
            style: kFormInput,
          ),
          Slider(
            value: numberCharPassword,
            min: 6.0,
            max: 20.0,
            onChanged: (double value) {
              setState(() {
                numberCharPassword = value;
              });
            },
          )
        ],
      ),
    );
  }

  generateButton() {
    return FlatButton(
      child: Text(
        'Generate',
        style: TextStyle(color: Colors.white),
      ),
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: () {
        // print(generatePassword(isWithLetters, isWithUppercase, isWithNumbers,
        //     isWithSpecial, numberCharPassword));
        print("Button pressed");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Password"),
      ),
      backgroundColor: kBackground,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text(
                    newPass,
                    style: kPasswordPreviewStyle,
                  ),
                ),
              ),
              lowerCaseButton(),
              upperCaseButton(),
              numbersButton(),
              specialCharactersButton(),
              numberSlider(),
              generateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
