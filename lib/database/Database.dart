import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocerypromotionsapp/database/Product.dart';

class Database{

  final CollectionReference productsCollection = Firestore.instance.collection("products");


  Future addProduct(String name,String shopName,String photoUrl,double price,String userId,double id) async{
    return await productsCollection.document(id.toString()).setData({
      'name': name ?? "empty_name",
      'shopName' : shopName ?? "empty_shop_name",
      'photoUrl' : photoUrl ?? "https://www.craigfouche.co.za/wp-content/uploads/2015/07/City-No-Camera-icon.png",
      'price' : price ?? 0.0,
      'userId' : userId,
      'id':id
    });
  }

}