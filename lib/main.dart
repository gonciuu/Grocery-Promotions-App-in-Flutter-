import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/auth/Authience.dart';
import 'package:provider/provider.dart';

import 'screens/Wrapper.dart';

void main() {
  runApp(AppView());
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value : Authience().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
