/// email : "a@mail.com"
/// password : "123456"
/// name : "hjhjgyjgh"

class LoginPageModel {
  LoginPageModel({
      String? email, 
      String? password, 
      String? name,}){
    _email = email;
    _password = password;
    _name = name;
}

  LoginPageModel.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _name = json['name'];
  }
  String? _email;
  String? _password;
  String? _name;
LoginPageModel copyWith({  String? email,
  String? password,
  String? name,
}) => LoginPageModel(  email: email ?? _email,
  password: password ?? _password,
  name: name ?? _name,
);
  String? get email => _email;
  String? get password => _password;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['name'] = _name;
    return map;
  }

}