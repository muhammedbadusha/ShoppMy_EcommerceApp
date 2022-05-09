part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocEvent {}
class LoginCheckEvent extends LoginblocEvent{
  final String username;
  final String userpassword;
  final String useremail;
  LoginCheckEvent(this.username,this.userpassword,this.useremail);
}
