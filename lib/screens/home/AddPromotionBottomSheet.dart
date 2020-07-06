import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/auth/Authience.dart';
import 'package:grocerypromotionsapp/database/Database.dart';
import 'package:grocerypromotionsapp/screens/constans/borders.dart';
import 'package:grocerypromotionsapp/screens/constans/text_style.dart';

class AddPromotionBottomSheet extends StatefulWidget {
  @override
  _AddPromotionBottomSheetState createState() =>
      _AddPromotionBottomSheetState();
}

class _AddPromotionBottomSheetState extends State<AddPromotionBottomSheet> {
  String _name, _shopName, _photoUrl;
  double _price;

  final _db = Database();

  String errorMessage = "";

  final _key = GlobalKey<FormState>();

  bool isNumeric(String s) {
    try{
      double.parse(s);
      return true;
    }catch(e){
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              Text(
                "Add promotion",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[900],
                    fontFamily: "mont",
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Add product information",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                    fontFamily: "mont",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                  validator: (name) =>
                      name.isEmpty ? "Please enter full name" : null,
                  style: regular_text,
                  decoration: little_radius_border.copyWith(
                      hintText: "Product name",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 22.0,
                      )),
                  onChanged: (nm) => setState(() => this._name = nm)),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                  validator: (url) => url.isEmpty || !url.contains("http") ? "Please enter correct url" : null,
                  style: regular_text,
                  decoration: little_radius_border.copyWith(
                      hintText: "Product image URL",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 22.0,
                      )),
                  onChanged: (url) => setState(() => this._photoUrl = url)),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                  validator: (shop) => shop.isEmpty ? "Please enter full shop name":null ,
                  style: regular_text,
                  decoration: little_radius_border.copyWith(
                      hintText: "Shop",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 22.0,
                      )),
                  onChanged: (shop) => setState(() => this._shopName = shop)),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                  validator: (price)=> price.isEmpty || !isNumeric(price) ? "Enter correct price" : null,
                  keyboardType: TextInputType.number,
                  style: regular_text,
                  decoration: little_radius_border.copyWith(
                      hintText: "Price",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 22.0,
                      )),
                  onChanged: (price) =>
                      setState(() => this._price = double.parse(price))),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      onPressed: () async {
                        if(_key.currentState.validate()) {
                          dynamic uid = await Authience().getId();
                          dynamic result = await _db.addProduct(this._name, this._shopName, this._photoUrl, this._price, uid, DateTime.now().millisecondsSinceEpoch);
                          if (result == null && uid == null) {
                            setState(() =>
                            this.errorMessage =
                            "Something went wrong. Check your internet connection");
                          }else{
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text(
                        "Add new product",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: "mont",
                            fontWeight: FontWeight.w600),
                      ),
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "$errorMessage",
                      style: TextStyle(
                          color: Colors.red[500],
                          fontSize: 14.0,
                          fontFamily: "mont",
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

