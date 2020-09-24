import 'package:banking/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:banking/models/bank.dart';

class HomePage extends StatelessWidget {
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
        body: BankList(),
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
