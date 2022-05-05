import 'dart:convert';

import 'package:http/http.dart';

import 'package:orgfirstproject/ModelClasses/SignupModel.dart';
import 'package:orgfirstproject/Repository/api_client.dart';

class UserApi{
  final signuppath ="/signup";
  ApiClient apiClient =ApiClient();

 // ?email=person1%40gmail.com&password=person1&name=nameperson

  //sign up page start
Future<SignupModel>  SignupFunction(dynamic name1,dynamic email1,dynamic password1)async{
  Response response=await apiClient.invokeAPI(signuppath+'?email=$email1&password=$password1&name=$name1', "POST", null);
 return SignupModel.fromJson(jsonDecode(response.body));
//return SignupPageClass(name: name1, email: email1, password: password1);
}

  //login page start
  // Future <LoginPageclass> loginPageFunction(String email, String name, String password)async{
  //   String body= '{ "email": "$email", "password": "$password",  "name": "$name"  }';
  //   Response response=await apiClient.invokeAPI(getpath+'?email=$email&password=$pa', 'POST', body);
  //   return LoginPageModel.fromJson(jsonDecode(response.body));
  // }

  //new future function
}
///////////////////////////classes


// class LoginPageclass {
//
// }

