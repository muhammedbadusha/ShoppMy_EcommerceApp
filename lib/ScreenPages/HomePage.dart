import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 38),
        child: Container(
          height: MediaQuery.of(context).size.height * .99,
          width: MediaQuery.of(context).size.width * .99,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Card(
              color: Colors.white,
              elevation: 3.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipPath(
                      clipper:

                      WaveClipperTwo(reverse: false),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .30,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('ShOpP My',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 30),)),

                      ),
                    ),
                    //////1st email
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Icon(
                            Icons.forward_to_inbox,
                            size: 17,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .11,
                          width: MediaQuery.of(context).size.width * .80,
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: Form(
                            child: TextFormField(
                              cursorColor: Colors.red,
                              autofillHints: [AutofillHints.email],
                              controller: emailController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Email",
                              ),
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
                          height: MediaQuery.of(context).size.height * .11,
                          width: MediaQuery.of(context).size.width * .80,
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: TextField(
                            autofillHints: [AutofillHints.password],
                            cursorColor: Colors.red,
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Password",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Forgot the password?',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .80,
                        decoration: BoxDecoration(
                            //boxShadow: [
                          // BoxShadow(
                          //     color: Colors.blue,
                          //     offset: Offset(
                          //       5.0,
                          //       5.0,
                          //     ),
                          //     blurRadius: 10.0,
                          //     spreadRadius: 1.0)
                       // ]
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('LOG IN'))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

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
