import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:orgfirstproject/ApiCalls/UserApi.dart';
import 'package:orgfirstproject/Blocs/Passwordeye/hide_text_bloc.dart';
import 'package:orgfirstproject/Blocs/SignupBloc/signupbloc_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:orgfirstproject/ModelClasses/SignupModel.dart';
import 'package:orgfirstproject/ScreenPages/HomeScreen.dart';
import 'package:orgfirstproject/ScreenPages/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String? chekkingvlaue;
  //const SignupPage({Key? key}) : super(key: key);
  UserApi userApi = UserApi();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  var _key = GlobalKey<FormState>();

  // bool _obscureText = true;
bool passwordshow = false;
SignupModel signupModel=SignupModel();

  @override
  Future<void> saveData()async{
    final sharePrefobj=await SharedPreferences.getInstance();
    sharePrefobj.setString('signId',chekkingvlaue.toString());
  }
  Widget build(BuildContext context) {
    _submit() {
      print(emailController.toString());
      if (_key.currentState!.validate()) {
        BlocProvider.of<SignupblocBloc>(context).add(SignconformEvent(nameController.value.text,emailController.value.text,passwordController.value.text));
      } else {
        return print('Not valid details');
      }
    }
    return BlocListener<SignupblocBloc, SignupblocState>(
  listener: (context, state) {
    if(state is SignupblocLoading){
      Loader.show(context,
          isSafeAreaOverlay: false,
          isAppbarOverlay: true,
          isBottomBarOverlay: false,
          progressIndicator: CircularProgressIndicator(),
          themeData: Theme.of(context)
              .copyWith(accentColor: Colors.black38),
          overlayColor: Color(0x99E8EAF6));
    }
    if(state is SignupblocLoaded){

      chekkingvlaue=signupModel.id.toString();
      Loader.hide();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
    if(state is SignupblocError){
      Text('something went wrong');
    }
    Text('server side error');
    // TODO: implement listener
  },

  child: Scaffold(
      body: Padding
        (
        padding: const EdgeInsets.only(top: 38),
        child: Container(
          height: MediaQuery.of(context).size.height * .99,
          width: MediaQuery.of(context).size.width * .99,
          child: Card(
            color: Colors.greenAccent,
            elevation: 3.8,
            child: SingleChildScrollView(
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
                          children: const [
                            Text(
                              'Create',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1),
                            ),
                            Text(
                              'Account',
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
                  // CircleAvatar(
                  //   backgroundColor: Colors.red,
                  //   radius: 50,
                  // ),
                  //////1st email
                  Form(
                      key: _key,
                      child: Container(
                        //height: MediaQuery.of(context).size.height *.27,

                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                  child: Icon(
                                    Icons.person,
                                    size: 17,
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .80,
                                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                                  child: TextFormField(

                                    controller: nameController,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter your name";
                                      }
                                    },
                                    autofillHints: [AutofillHints.email],
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Username",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                  child: Icon(
                                    Icons.email,
                                    size: 17,
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .80,
                                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                              .hasMatch(val)) {
                                        return "Enter valid email";
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                  child: Icon(
                                    Icons.lock,
                                    size: 17,
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .80,
                                  padding: EdgeInsets.fromLTRB(10, 30, 10, 05),
                                  child:
                                      BlocBuilder<HideTextBloc, HideTextState>(
                                    builder: (context, state) {
                                      return TextFormField(
                                        controller: passwordController,
                                        validator: (val) {
                                          if (val == "") {
                                            return "password Can't Empty";
                                          } else if (val!.length < 6) {
                                            return "Password must be 6 character or above";
                                          }
                                        },
                                        autofillHints: [AutofillHints.password],
                                        cursorColor: Colors.red,
                                        obscureText: passwordshow,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                // // BlocProvider.of<HideTextBloc>(
                                                // //         context)
                                                //     .add(Hidetext());

                                                setState(() {
                                                  passwordshow = !passwordshow;
                                                });

                                              },
                                              icon: Icon(
                                               passwordshow
                                                    ? Icons
                                                        .visibility_off_outlined
                                                    : Icons.visibility,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              )),
                                          border: UnderlineInputBorder(),
                                          labelText: "Password",
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),

                  // Container(
                  //     alignment: Alignment.centerRight,
                  //     height: MediaQuery.of(context).size.height * .05,
                  //     width: MediaQuery.of(context).size.width,
                  //     child: TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           'Forgot the password?',
                  //           style: TextStyle(
                  //               color: Colors.blue,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500),
                  //         ))),
                  Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .80,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                          onPressed: () {

                            _submit();
                          },
                          child: Text('SIGN UP'))),

                  Row(
                    children: [
                      Container(
                        height: 50,
                        // color: Colors.yellow,
                        width: 190,
                        child: Divider(
                          indent: 7,
                          endIndent: 5,
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Text('or'),
                      Container(
                        height: 50,
                        // color: Colors.red,
                        width: 190,
                        child: Divider(
                          indent: 3,
                          endIndent: 3,
                          color: Colors.black,
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text(
                              'LOG IN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ))),
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
