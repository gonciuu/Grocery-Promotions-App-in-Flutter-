
import 'package:firebase_auth/firebase_auth.dart';

class Authience{

  FirebaseAuth auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
        AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return user;
    }catch(e){
      print(e);
      return null;
    }
  }


  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }catch(e){
      print(e);
      return null;
    }
  }

}