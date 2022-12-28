
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../busuness_logic/bloc/app_bloc.dart';


class forgotPassword extends StatelessWidget {

  TextEditingController emailController = TextEditingController();

  static Route route(){
    return MaterialPageRoute<void>(builder: (_)=> forgotPassword());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Center(child:

          TextField(
            controller: emailController,
            decoration: InputDecoration(
             labelText: 'email'
    ),
    )
           ,),
           ElevatedButton(onPressed: (() async{
             await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
             //context.read<AppBloc>().add(AppResetPasswword(emailController.text.trim()));
           }), child: Text("Reset"))
        ],

        
      ),
    );
  }
}