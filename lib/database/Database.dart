import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocerypromotionsapp/database/Product.dart';

class Database{

  final CollectionReference productsCollection = Firestore.instance.collection("products");


  Future addProduct(String name,String shopName,String photoUrl,double price,String userId,int id) async{
    try{
      return await productsCollection.document(id.toString()).setData({
        'name': name ?? "empty_name",
        'shopName' : shopName ?? "empty_shop_name",
        'photoUrl' : photoUrl ?? "https://www.craigfouche.co.za/wp-content/uploads/2015/07/City-No-Camera-icon.png",
        'price' : price ?? 0.0,
        'userId' : userId,
        'id':id
      });
    }catch(e){
      return null;
    }
  }


  List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((e) => Product(
      name: e.data['name'] ?? "name",
      shopName: e.data["shopName"] ?? "shop_name",
      photoUrl: e.data["photoUrl"] ?? "photo_url",
      price: e.data['price'] ?? 0.0,
      userId: e.data['userId'],
      id: e.data['id']
    )).toList();
  }

  Stream<List<Product>> get products => productsCollection.snapshots().map(_productListFromSnapshot);

}