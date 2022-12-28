// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
//import 'package:flutter/cupertino.dart';


import 'package:notesbloc/Models/user_model.dart';
class AuthRespository{
  final firebase_auth.FirebaseAuth _firebaseAuth;
  AuthRespository({firebase_auth.FirebaseAuth? firebaseAuth}) : _firebaseAuth=firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  User currenUser=  User(id: "") ;

  Stream<User> get user {
return _firebaseAuth.authStateChanges().map((firebaseUser){
  final user= firebaseUser==null ? User.empty : firebaseUser.toUser;
  currenUser=user;
  return user;
} );
  }
   Future<void> signup({required String email , required String password,})async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(_){}
   }
   Future<void> logInWithEmailAndPassword({
    required String email,
    required String password
   })async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(_){
      print(_.toString());
    }
   }
   Future<void> LogOut()async{
   try{
     await Future.wait([_firebaseAuth.signOut()]);
   }catch(_){}
   }

   Future<void> resetPaswword({
  required String email,
   })async{
    
   try{
     await Future.wait([_firebaseAuth.sendPasswordResetEmail(email:email.trim())]);
      
   }catch(_){
    return print(_);
   }
   }
  
   
   
}
extension on firebase_auth.User{
  User get toUser{
    return User(id: uid , email: email , name : displayName, photo : photoURL);
  }
}

