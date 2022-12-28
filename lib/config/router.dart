// ignore_for_file: no_duplicate_case_values
import"package:flutter/widgets.dart";
import 'package:notesbloc/busuness_logic/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:notesbloc/screens/home_screen.dart';
import 'package:notesbloc/screens/login_screen.dart';

List<Page> onGenerateAppViewPages(AppStatus state , List<Page<dynamic>> pages,)
{
switch(state){
  case AppStatus.authenticated:return[HomeScreen.page()];
  case AppStatus.unauthenticated:return[LoginScreen.page()];
 
}
}