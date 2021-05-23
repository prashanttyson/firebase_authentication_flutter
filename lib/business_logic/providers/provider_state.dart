import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProviderState extends ChangeNotifier{

  String _uid,_email;
  String get getUid =>_uid;
  String get getEmail => _email;
  FirebaseAuth _auth=FirebaseAuth.instance;




  Future<bool> createUserAccount(String email, String password) async{
    bool success = false;
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if(userCredential!=null){
        _uid = userCredential.user.uid;
        _email=userCredential.user.email;

        return success = true;
      }
    }catch(e){

    }
    return success;
  }

  Future<bool> signInWithUserAccount(String email, String password) async{
    bool success = false;
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if(userCredential!=null){
        _uid = userCredential.user.uid;
        _email=userCredential.user.email;

        return success=true;
      }
    }catch(e){

    }
    return success;
  }

  Future<bool> signOut() async{
    bool success = false;
    try{
      await _auth.signOut();
      return success = true;
    }catch(e){

    }
    return success;
  }


}