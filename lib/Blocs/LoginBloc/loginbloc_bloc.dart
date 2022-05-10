

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orgfirstproject/ApiCalls/UserApi.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  String logincheck="";
  //"Login Successful"
  //"Incorrect Email or password!"
  UserApi userApi;
  LoginblocBloc(this.userApi) : super(LoginblocInitial()) {
    on<LoginCheckEvent>((event, emit)async {
      emit(LoginblocLoading());

     // print("$logincheck"+"printed login check under");
try{
  logincheck=await userApi.loginPageFunction(event.username,event.useremail, event.userpassword );
  if(logincheck=="\"Login successful!\""){
    print('success to loginpage equal');
    emit(LoginblocLoaded());
  }else{
    emit(LoginIncorrect());
  }
}catch(error){
  emit(LoginblocError());
}
      // catch(error){
      //   emit(LoginblocError());
      //   print(error);
      // }
    });
  }
}
