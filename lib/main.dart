// ignore_for_file: deprecated_member_use, unnecessary_import, unused_import

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_observer/Observer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesbloc/busuness_logic/bloc/app_bloc.dart';
import 'package:notesbloc/controlers/auth_controller.dart';
import 'package:notesbloc/firebase_options.dart';
import 'package:notesbloc/screens/login_screen.dart';
import '/bloc_observer.dart';
import 'package:flow_builder/flow_builder.dart';

import 'config/router.dart';





void main() {
  return BlocOverrides.runZoned(() async{
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
     );
     final authRespository = AuthRespository();
 runApp( App(authRespository:authRespository));
    
  },
  blocObserver: AppBlocObserver(),

  );
  
 
}

class App extends StatelessWidget {
  final AuthRespository _authRespository;
  const App({
    Key? key,
    required AuthRespository authRespository
  
  }) : _authRespository = authRespository , super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(value: _authRespository,
    child: BlocProvider(create: (_)=>AppBloc(authRepository: _authRespository),
    child: const AppView(),),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home:
      FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages),
    );
  }
}

