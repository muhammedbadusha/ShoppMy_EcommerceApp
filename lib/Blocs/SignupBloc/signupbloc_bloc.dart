import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orgfirstproject/ApiCalls/UserApi.dart';
import 'package:orgfirstproject/ModelClasses/SignupModel.dart';

part 'signupbloc_event.dart';
part 'signupbloc_state.dart';

class SignupblocBloc extends Bloc<SignupblocEvent, SignupblocState> {
  late SignupModel signupModel;
  UserApi userApi;
  SignupblocBloc(this.userApi) : super(SignupblocInitial()) {
    on<SignconformEvent>((event, emit)async {
      emit(SignupblocLoading());
      try{
        signupModel=await userApi.SignupFunction(event.username, event.useremail, event.userpassword);
        emit(SignupblocLoaded());
      }
      catch(error){
        emit(SignupblocError());
      }
      // TODO: implement event handler
    });
  }
}
