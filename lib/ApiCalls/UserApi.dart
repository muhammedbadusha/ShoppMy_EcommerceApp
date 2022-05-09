import 'dart:convert';

import 'package:http/http.dart';

import 'package:orgfirstproject/ModelClasses/SignupModel.dart';
import 'package:orgfirstproject/Repository/api_client.dart';

class UserApi{
  final signuppath ="/signup";
  final loginpath="/login";
  ApiClient apiClient =ApiClient();

  //sign up page start
Future<SignupModel>  SignupFunction(dynamic name1,dynamic email1,dynamic password1)async{
  Response response=await apiClient.invokeAPI(signuppath+'?email=$email1&password=$password1&name=$name1', "POST", null);
 return SignupModel.fromJson(jsonDecode(response.body));
//return SignupPageClass(name: name1, email: email1, password: password1);
}

  // login page start
  Future <String> loginPageFunction(String name,String email, String password)async{
    String body= '{"name":"$name","email": "$email", "password": "$password"}';
    Response response=await apiClient.invokeAPI(loginpath,"POST", body);
    print("ha ha"+response.body);
   return response.body ;
  }


}




