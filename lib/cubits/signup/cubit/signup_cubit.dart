import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notesbloc/controlers/auth_controller.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRespository _authRespository;
  SignupCubit(this._authRespository) : super(SignupState.initial());
 void emailChanged(String value){
  emit(
    state.copyWith(
      
      email: value,
      status: SignupStatus.initial,
    )
  
  );
 }

 void passwordChanged(String value){
  emit(
    state.copyWith(
      password: value,
      status: SignupStatus.initial,
    )
    );

 }
 Future<void> signupFormSubmitted() async{
  if(state.status == SignupStatus.submitting)return;
  emit(state.copyWith(status: SignupStatus.submitting));
  try{
    await _authRespository.signup(email: state.email, password: state.password);
    emit(state.copyWith(status: SignupStatus.succcess));
  }catch(_){}

 }

}
