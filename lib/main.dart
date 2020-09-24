import 'package:banking/views/auth.dart';
import 'package:banking/views/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget{

  Widget build(BuildContext context){
    return StreamProvider(
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