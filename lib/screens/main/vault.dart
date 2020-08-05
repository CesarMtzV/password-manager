import 'package:flutter/material.dart';
import 'package:password_manager/models/account.dart';
import 'package:password_manager/utilities/styles.dart';
import 'package:provider/provider.dart';
import './new_card.dart';
import '../../widgets/drawer.dart';

class Vault extends StatefulWidget {
  Vault({Key key}) : super(key: key);

  _VaultState createState() => _VaultState();
}

class _VaultState extends State<Vault> {
  bool isSearching = false;

  String email = "test@test.com", userName = "V";

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<List<Account>>(context);

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: !isSearching
            ? Text("RUNE")
            : TextField(
                decoration: InputDecoration(
                  hintText: "Search here",
                  hintStyle: TextStyle(color: Colors.white),
                  icon: Icon(Icons.search),
                ),
              ),
        backgroundColor: Color(0xFF484848),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewCard(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Color(0xFFC62828),
      ),
      drawer: AppDrawer(),
      body: (accounts != null)
          ? ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewCard(accounts[index]),
                      ),
                    );
                  },
                  child: Card(
                    color: Color(0xFF484848),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              accounts[index].siteName,
                              style: kCardTextSiteNameStyle,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              accounts[index].userName,
                              style: kCardTextUserNameStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
