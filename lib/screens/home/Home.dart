import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/screens/home/AddPromotionBottomSheet.dart';
import 'package:grocerypromotionsapp/screens/home/ItemsList.dart';

import 'ItemTile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Promotions",
          style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontFamily: "mont",
              fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.backspace,
              color: Colors.white,
            ),
            label: Text(
              "Log out",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: "mont",
                  fontWeight: FontWeight.w600),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ItemsList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showModalBottomSheet( shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
              context: context, builder: (builder)=>AddPromotionBottomSheet());
        },
        child: Icon(Icons.add),
      )
    );
  }
}
