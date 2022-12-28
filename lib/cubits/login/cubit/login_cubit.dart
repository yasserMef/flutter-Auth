// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notesbloc/controlers/auth_controller.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRespository _authRespository;
  LoginCubit(this._authRespository) : super(LoginState.initial());

  void emailChanged(String value){
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value){
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }
 
  

  Future<void>LogInWithCredentials() async{
    if(state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try{
      await _authRespository.logInWithEmailAndPassword(
        email: state.email, password:state.password);
        emit(state.copyWith(status: LoginStatus.succcess));
    }catch(_){}

    

  }

  

  

  
}
