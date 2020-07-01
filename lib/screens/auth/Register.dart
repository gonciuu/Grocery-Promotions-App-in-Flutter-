import 'package:flutter/material.dart';
import 'package:grocerypromotionsapp/auth/Authience.dart';
import 'package:grocerypromotionsapp/screens/constans/borders.dart';
import 'package:grocerypromotionsapp/screens/constans/text_style.dart';


class Register extends StatefulWidget {

  final Function changeScreen;
  Register(this.changeScreen);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email="";
  String password="";

  final _authience = Authience();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                  "https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png",
                  scale: 4),SizedBox(height: 5.0,),
              Text("Create Account",
                  style: bold_text.copyWith(
                      fontSize: 32.0, color: Colors.grey[900])),
              SizedBox(
                height: 5.0,
              ),
              Text("Sign up to continue",
                  style: regular_text.copyWith(
                      color: Colors.grey[700], fontSize: 20.0)),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                validator: (eml)=> eml.isEmpty || !eml.contains('@') ? "Enter correct email":null,
                decoration: little_radius_border.copyWith(
                    hintText: "email",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                style:
                TextStyle(fontFamily: "mont", fontWeight: FontWeight.w500),
                onChanged: (eml)=> setState(()=>this.email = eml),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                obscureText: true,
                validator: (psw)=> psw.length<6 ? "Enter password minimum 6 chars length":null,
                decoration: little_radius_border.copyWith(
                    hintText: "password",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 22.0,
                    )),
                style:
                TextStyle(fontFamily: "mont", fontWeight: FontWeight.w500),
                onChanged: (psw)=> setState(()=>this.password = psw),
              ),SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
                      onPressed: () async{
                        if(_key.currentState.validate()){
                          dynamic result = await _authience.registerWithEmailAndPassword(email, password);
                          if(result==null){
                            print("Coś się yłebo");
                          }else{
                            print(result);
                          }
                        }
                      } ,
                      child: Text(
                        "REGISTER",
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
              GestureDetector(
                onTap: ()=>widget.changeScreen(),
                child: Text(
                  "Have account already? ",
                  style: regular_text.copyWith(color: Colors.grey[900], fontSize: 14.0),
                ),
              ),
              GestureDetector(
                onTap: ()=>widget.changeScreen(),
                child: Text(
                  "Sign In!",
                  style: regular_text.copyWith(color: Colors.amber, fontSize: 15.0,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
