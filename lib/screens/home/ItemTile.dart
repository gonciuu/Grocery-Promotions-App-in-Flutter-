import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/database/Product.dart';

class ItemTile extends StatelessWidget {

  final Product product;
  ItemTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            title: Text(product.name),
            leading: ClipRRect(
              child: FadeInImage.assetNetwork( image: product.photoUrl, placeholder: 'img/camera.png',width: 70.0,height: 70.0,),
              borderRadius: BorderRadius.circular(20.0),
            ),
            subtitle: Text("${product.price}£, ${product.shopName}"),
          ),
        ),
      ),
    );
  }
}
