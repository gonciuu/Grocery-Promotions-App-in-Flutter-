import 'package:flutter/material.dart';

import 'screens/Wrapper.dart';

void main() {
  runApp(AppView());
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
