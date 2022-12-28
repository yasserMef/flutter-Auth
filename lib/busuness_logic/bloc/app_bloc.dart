import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notesbloc/controlers/auth_controller.dart';

import '../../Models/user_model.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  /* Variables  */
  final AuthRespository _authRepository;
  StreamSubscription<User>? _userSubscription;
  AppBloc({required AuthRespository authRepository}) :

  /* Constructor  */
  _authRepository = authRepository, super(
          (authRepository.currenUser.isNotEmpty ) ?
          AppState.authenticated(authRepository.currenUser):
          const AppState.unauthenticated()) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    //on<AppResetPasswword>(_onResetPassword);
    _userSubscription = _authRepository.user.listen((user)=> add(AppUserChanged(user)));
  }

  /* When user change   */
  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit){
      emit(event.user.isNotEmpty ?
      AppState.authenticated(event.user):
      const AppState.unauthenticated());
  }

  /* When user logged out   */
  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit,){
      unawaited(_authRepository.LogOut());
  }

  /* When user logged out   */
  //void _onResetPassword(AppResetPasswword event, Emitter<AppState> emit) {
    //if (event.email != null) {
  //  unawaited(_authRepository.resetPaswword(email:event.email));
    //}
    //else{
    // show popup email no valid
    // }
  //}
    
    

  @override
  Future<void> close(){
    _userSubscription?.cancel();
    return super.close();
  }
 
  
  
  

}

