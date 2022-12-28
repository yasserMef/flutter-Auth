import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesbloc/busuness_logic/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

 

static Page page() => const MaterialPage(child: HomeScreen());


  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc)=> bloc.state.user);
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),
      actions: [
        ElevatedButton(onPressed: (){}, child: CircleAvatar(
          radius: 50,
          backgroundImage: 
          user.photo != null ? NetworkImage(user.photo!):null,
          child: user.photo == null ? Icon(Icons.person):null,
        )),
        IconButton(onPressed: (() {
          context.read<AppBloc>().add(AppLogoutRequested());
        }), icon: Icon(Icons.exit_to_app)),
        
      ],),
    );
  }
}