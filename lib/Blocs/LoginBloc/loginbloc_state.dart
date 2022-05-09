part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocState {}

class LoginblocInitial extends LoginblocState {}
class LoginblocLoading extends LoginblocState  {}
class LoginblocLoaded extends  LoginblocState  {}
class LoginblocError extends  LoginblocState  {}