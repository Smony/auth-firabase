import 'package:banking/views/auth.dart';
import 'package:banking/views/home.dart';
import 'package:banking/views/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of(context);
    final isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthPage();
  }
}
