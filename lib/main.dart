import 'package:banking/services/auth.dart';
import 'package:banking/views/route.dart';
import 'package:banking/views/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget{

  Widget build(BuildContext context){
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home: RoutePage(),
      ),
    );
  }
}