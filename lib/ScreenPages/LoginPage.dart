import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  //bool isPhone(String input) => RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')

  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();

  GlobalKey<FormState> _key = new GlobalKey();
 // String formFieldValue;
  _submit() {
    if (_key.currentState!.validate()) {
      return ;
    } else {
      return 'something wrong';
    }
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 38),
        child: Container(
          height: MediaQuery.of(context).size.height * .99,
          width: MediaQuery.of(context).size.width * .99,

          child: Card(
            color: Colors.greenAccent,
            elevation: 3.8,
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipperTwo(reverse: false),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text(
                                'Welcome',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                              Text(
                                'Back',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //////1st email
                    Container(
                      //height: MediaQuery.of(context).size.height *.27,

                      child: Column(
                      children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Icon(
                            Icons.lock,
                            size: 17,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .10,
                          width: MediaQuery.of(context).size.width * .80,
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: TextFormField(
                            controller: emailcontroller,
                            validator: ( value) {
                              if(value==""){
                                return "emial Can't Empty";
                              } if(RegExp(z).hasMatch(value)){
                                return "Please enter validate email";
                              }
                            },
                            autofillHints: [AutofillHints.email],
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Email",
                            ),
                          ),
                        ),
                      ],
                    ),
                      ////////////2nd
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                            child: Icon(
                              Icons.lock,
                              size: 17,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .80,
                            padding: EdgeInsets.fromLTRB(10, 30, 10, 05),
                            child: TextFormField(
                              validator: (val) {
                                if(val ==""){
                                  return "password Can't Empty";
                                }else if(val!.length<5){
                                  return "password must be 6 character or above";
                                }
                              },
                              autofillHints: [AutofillHints.password],
                              cursorColor: Colors.red,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Password",
                              ),
                            ),
                          ),
                        ],
                      ),
                      ],
                    ),
                    ),

                    Container(
                        alignment: Alignment.centerRight,
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot the password?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ))),
                    Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .80,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              _submit();


                            },
                            child: Text('LOG IN'))),
                Divider(height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.black,),
                Row(
                  children: [
                    Divider( height: 20,
                        thickness: 5,
                        indent: 20,
                        endIndent: 0,
                        color: Colors.red,),
                  ],
                )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
