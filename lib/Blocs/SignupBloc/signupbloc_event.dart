part of 'signupbloc_bloc.dart';

@immutable
abstract class SignupblocEvent {}
class SignconformEvent extends SignupblocEvent{
  final dynamic username;
  final dynamic userpassword;
  final dynamic useremail;
 SignconformEvent(this.username,this.useremail,this.userpassword);

}
