// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesbloc/busuness_logic/bloc/app_bloc.dart';
import 'package:notesbloc/controlers/auth_controller.dart';
import 'package:notesbloc/cubits/login/cubit/login_cubit.dart';
import 'package:notesbloc/screens/forgotPassword.dart';
import 'package:notesbloc/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  
  const LoginScreen({super.key});
  
  static Page page()=> const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:BlocProvider(create: (_)=>LoginCubit
        (context.read<AuthRespository>()),
        child:LoginForm(),
        ) ,
        ));
     
  }

  
}

class LoginForm extends StatelessWidget {
  
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>( 
      listener: (context,state){
        if(state.status == LoginStatus.error){

        }
    
    },
   
      
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LoginInput(),
        const SizedBox(height: 20,),
        _PasswordInput(),
        const SizedBox(height: 20,),
         const SizedBox(height: 20,),
         _ForgotPasswordButton(),
        _LoginButton(),
        const SizedBox(height: 20,),
         
        _SignupButton(),
        
      ],
    ) ,) 
  
 ;
   
  }
}

class _LoginInput extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    var email;
    GlobalKey<FormState> formastate = GlobalKey<FormState>();
    return BlocBuilder<LoginCubit,LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context,state){
      
  return
  Form(
    key: formastate,
    child: TextField(
      
    onChanged: (email) {
    context.read<LoginCubit>().emailChanged(email);
    },
    decoration: const InputDecoration(
      labelText: 'email'
    ),
    ));
   
    
    
    });
  }
}

class _PasswordInput extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginCubit,LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context,state){
      
  return TextField(
    onChanged: (password) {
    context.read<LoginCubit>().passwordChanged(password);
    },
    decoration: const InputDecoration(
      labelText: 'password'
    ),
    );
    });
  }
}

class  _ForgotPasswordButton extends StatelessWidget {
  const  _ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.of(context).push(forgotPassword.route());
  }, 
     child: Text("Forgot Password"));
  }
}

class _LoginButton extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     return  BlocBuilder<LoginCubit,LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context,state){
      
  return state.status == LoginStatus.submitting ? const CircularProgressIndicator():
  ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(200 ,  40),
    ),
    onPressed: (() {
    context.read<LoginCubit>().LogInWithCredentials();
  }), child: Text('Login'));
  
  });
  }
}

class _SignupButton extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(200 ,  40),
    ),
    onPressed: (() {
    Navigator.of(context).push(SignupScreen.route());
  }), child: Text('sign Up'));
  }
}