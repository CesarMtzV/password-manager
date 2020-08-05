import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:password_manager/utilities/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final String _version = "v.PRE-ALPHA";
  final githubImageURL =
      "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png";
  final repoURL = 'https://github.com/CesarMtzV/password-manager';
  final linkedinImageURL =
      "https://fatimamartinez.es/wp-content/uploads/2019/02/Linkedin-logo.png";

  final cesarGitHubURL = "https://github.com/CesarMtzV";
  final cesarLinkedInURL = "https://www.linkedin.com/in/cesarmtzv/";
  final alexGitHubURL = "https://github.com/alexvargas01";
  final alexLinkedInURL = "https://www.linkedin.com/in/alexvargas01/";

  Future<dynamic> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text("About Rune"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Rune",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 50,
              ),
              SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            "Rune is an easy to use Password Manager that helps users keep track of their accounts in a safe manner."),
                    TextSpan(
                        text:
                            "\n\nApp created by Cesar Martinez & Alex Vargas"),
                    TextSpan(text: "\n\n$_version"),
                    TextSpan(text: "\n\nYou can find the repository here: "),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(githubImageURL),
                radius: 30,
                child: GestureDetector(
                  onTap: () => _launchURL(repoURL),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "   Contact Us    ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "César Martínez",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => {},
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "E-mail",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _launchURL(cesarGitHubURL),
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(githubImageURL),
                          radius: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "GitHub",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _launchURL(cesarLinkedInURL),
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(linkedinImageURL),
                          radius: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "LinkedIn",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Alex Vargas",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => {},
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "E-mail",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _launchURL(alexGitHubURL),
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(githubImageURL),
                          radius: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "GitHub",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _launchURL(alexLinkedInURL),
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(linkedinImageURL),
                          radius: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "LinkedIn",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
