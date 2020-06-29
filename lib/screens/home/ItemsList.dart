import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/screens/home/ItemTile.dart';
class ItemsList extends StatefulWidget {
  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemBuilder: (BuildContext context, int index) {
      return ItemTile();
    },
    itemCount: 10);
  }
}
