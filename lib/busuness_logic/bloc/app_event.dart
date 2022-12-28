part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}
/*class AppResetPasswword extends AppEvent{
  final String email;
  const AppResetPasswword(this.email);
}*/
class AppLogoutRequested extends AppEvent {}
class AppUserChanged extends AppEvent{
  final User user;
  const AppUserChanged(this.user);

  @override
  List<Object> get props =>[user] ;

}
