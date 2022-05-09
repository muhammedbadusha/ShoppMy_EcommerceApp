

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
      logincheck=await userApi.loginPageFunction(event.username,event.useremail, event.userpassword );
      print("$logincheck"+"printed login check under");
try{
  if(logincheck=="Login Successful"){
    print('success to loginpage equal');
  }else if(logincheck=="Incorrect Email or password!") {
    print('else if incorrect');
  }

}catch(error){
  print('hai');
}
      // catch(error){
      //   emit(LoginblocError());
      //   print(error);
      // }
    });
  }
}
