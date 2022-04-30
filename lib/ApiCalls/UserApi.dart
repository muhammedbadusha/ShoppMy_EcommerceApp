import 'dart:convert';

import 'package:http/http.dart';
import 'package:orgfirstproject/ModelClasses/LoginPageModel.dart';
import 'package:orgfirstproject/Repository/api_client.dart';

class UserApi{
  final signuppath ="/signup";
  ApiClient apiClient =ApiClient();
 // ?email=person1%40gmail.com&password=person1&name=nameperson

  //sign up page start
Future <SignupPageClass> SignupFunction(String name,String email,int password)async{
  Response response=await apiClient.invokeAPI(signuppath+'?email=$email&apssword=$password&name=$name', "POST", null);
return SignupPageClass(name: 'name', email: 'kdka', password: 123);
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
class SignupPageClass {
final String name;
final String email;
final int password;
const SignupPageClass({
  required this.name,
  required this.email,
  required this.password,
});
// factory SignupPageClass.fromJson(Map<String,dynamic>json){
//   return SignupPageClass(name: 'badu', email: 'adfa', password: 123);
// }
}

// class LoginPageclass {
//
// }

