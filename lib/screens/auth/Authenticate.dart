import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/screens/auth/Login.dart';
import 'package:grocerypromotionsapp/screens/auth/Register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isLogin = true;
  void changeScreen() => setState(() => isLogin = !isLogin);

  @override
  Widget build(BuildContext context) {
    return isLogin ? Login(changeScreen) : Register(changeScreen);
  }
}
