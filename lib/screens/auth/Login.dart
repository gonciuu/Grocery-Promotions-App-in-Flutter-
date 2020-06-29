import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/screens/constans/borders.dart';
import 'package:grocerypromotionsapp/screens/constans/text_style.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                  "https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png",
                  scale: 4),SizedBox(height: 5.0,),
              Text("Welcome back",
                  style: bold_text.copyWith(
                      fontSize: 32.0, color: Colors.grey[900])),
              SizedBox(
                height: 5.0,
              ),
              Text("Sign to continue",
                  style: regular_text.copyWith(
                      color: Colors.grey[700], fontSize: 20.0)),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                decoration: little_radius_border.copyWith(
                    hintText: "login",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                style:
                    TextStyle(fontFamily: "mont", fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: little_radius_border.copyWith(
                    hintText: "password",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                style:
                    TextStyle(fontFamily: "mont", fontWeight: FontWeight.w500),
              ),SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
                      onPressed: () {},
                      child: Text(
                        "LOGIN",
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
              ),SizedBox(height: 20.0,),
              Text(
                "Don't have account? ",
                style: regular_text.copyWith(color: Colors.grey[900], fontSize: 14.0),
              ),
              Text(
                "create new!",
                style: regular_text.copyWith(color: Colors.amber, fontSize: 15.0,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
