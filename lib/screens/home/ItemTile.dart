import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocerypromotionsapp/auth/Authience.dart';
import 'package:grocerypromotionsapp/database/Database.dart';
import 'package:grocerypromotionsapp/database/Product.dart';
import 'package:grocerypromotionsapp/screens/constans/Loading.dart';

class ItemTile extends StatefulWidget {

  final Product product;

  ItemTile(this.product);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  String userId;

  @override
  void initState() {
    super.initState();
    Authience().getId().then((result) {
      print(result);
      setState(() {
        if (result != null) userId = result.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return userId != null ? Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              title: Text(widget.product.name),
              leading: ClipRRect(
                child: FadeInImage.assetNetwork(image: widget.product.photoUrl,
                  placeholder: 'img/camera.png',
                  width: 70.0,
                  height: 70.0,),
                borderRadius: BorderRadius.circular(20.0),
              ),
              subtitle: Text(
                  "${widget.product.price}£, ${widget.product.shopName}"),
              trailing: userId == widget.product.userId ? GestureDetector(
                onTap: () async{
                  await Database().deleteProduct(widget.product.id.toString());
                },
                child: Icon(
                  Icons.delete, size: 32.0, color: Colors.amber,),
              ) : null
          ),
        ),
      ),
    ) : Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
            title: Text("Loading..."),
            leading: ClipRRect(
              child: FadeInImage.assetNetwork(image: widget.product.photoUrl,
                placeholder: 'img/camera.png',
                width: 70.0,
                height: 70.0,),
              borderRadius: BorderRadius.circular(20.0),
            ),
            subtitle: Text(
                "Loading..."),
        ),
      ),
    );
  }
}
