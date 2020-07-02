import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            title: Text("Example Item"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://image.ceneostatic.pl/data/products/15164190/i-pudliszki-ketchup-lagodny-700g.jpg"),
              radius: 25.0,
            ),
            subtitle: Text("25£, Biedronka")
          ),
        ),
      ),
    );
  }
}
