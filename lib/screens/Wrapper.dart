import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/screens/auth/Authenticate.dart';
import 'package:grocerypromotionsapp/screens/home/Home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if(user==null) return Authenticate();
    else return Home();
  }
}
