import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/database/Database.dart';
import 'package:grocerypromotionsapp/screens/constans/borders.dart';
import 'package:grocerypromotionsapp/screens/constans/text_style.dart';

class AddPromotionBottomSheet extends StatefulWidget {
  @override
  _AddPromotionBottomSheetState createState() =>
      _AddPromotionBottomSheetState();
}

class _AddPromotionBottomSheetState extends State<AddPromotionBottomSheet> {

  String _name,_shopName,_photoUrl,_userId;
  double _price;

  final _db = Database();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Form(
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
                style: regular_text,
                decoration: little_radius_border.copyWith(
                    hintText: "Product name",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                onChanged: (nm)=>setState(()=>this._name = nm)
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                style: regular_text,
                decoration: little_radius_border.copyWith(
                    hintText: "Product image URL",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                  onChanged: (url)=>setState(()=>this._photoUrl = url)
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                style: regular_text,
                decoration: little_radius_border.copyWith(
                    hintText: "Shop",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                  onChanged: (shop)=>setState(()=>this._shopName = shop)
              ),
              SizedBox(
                height : 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: regular_text,
                decoration: little_radius_border.copyWith(
                    hintText: "Price",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                  onChanged: (price)=>setState(()=>this._price = double.parse(price))
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      onPressed: () async {
                        dynamic result = await _db.addProduct(this._name, this._shopName, this._photoUrl, this._price, "fuheugh", DateTime.now().millisecondsSinceEpoch);
                        if(result == null){

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
            ],
          ),
        ),
      ),
    );
  }
}
