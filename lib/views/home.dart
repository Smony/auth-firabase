import 'package:banking/services/auth.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:banking/models/bank.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        appBar: AppBar(
          title: Text(
            'BankingApp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  AuthService().logOut();
                },
                icon: Icon(Icons.close, color: Colors.white,),
                label: SizedBox.shrink()
            ),
          ],
        ),

        body: selectIndex == 0 ? BankList() : PersonalList(),

        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.black12,
            selectedItemBackgroundColor: Theme.of(context).primaryColor,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: selectIndex,
          onSelectTab: (index) {
            setState(() {
              selectIndex = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.home,
              label: 'Schedule',
            ),
            FFNavigationBarItem(
              iconData: Icons.person_outline,
              label: 'Contacts',
            ),
          ],
        ),

      ),
    );
  }
}

class BankList extends StatelessWidget {
  final bank = <Bank>[
    Bank(title: 'fsdfds1', desc: 'dsfsdfds1', author: 'Rimma'),
    Bank(title: 'fsdfds2', desc: 'dsfsdfds2', author: 'Smony'),
    Bank(title: 'fsdfds3', desc: 'dsfsdfds3', author: 'Rimma'),
    Bank(title: 'fsdfds4', desc: 'dsfsdfds4', author: 'Smony'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: bank.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: ListTile(
                title: Text(
                  bank[index].title,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PersonalList extends StatelessWidget {
  final bank = <Bank>[
    Bank(title: 'fsdfds1', desc: 'dsfsdfds1', author: 'Rimma'),
    Bank(title: 'fsdfds2', desc: 'dsfsdfds2', author: 'Smony'),
    Bank(title: 'fsdfds3', desc: 'dsfsdfds3', author: 'Rimma'),
    Bank(title: 'fsdfds4', desc: 'dsfsdfds4', author: 'Smony'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: bank.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: ListTile(
                title: Text(
                  bank[index].author,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
