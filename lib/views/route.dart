import 'package:banking/views/auth.dart';
import 'package:banking/views/home.dart';
import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = false;

    return isLoggedIn ? HomePage() : AuthPage();
  }
}
