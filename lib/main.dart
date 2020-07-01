import 'package:flutter/material.dart';

import 'screens/Wrapper.dart';
import 'screens/constans/Loading.dart';

void main() {
  runApp(AppView());
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
    );
  }
}
