import 'package:flutter/material.dart';
import 'package:orgfirstproject/ScreenPages/LoginPage.dart';
import 'package:orgfirstproject/ScreenPages/SplashScreen.dart';

main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:LoginPage(),
      //SplashScreen(),
    );
  }
}
