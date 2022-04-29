import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orgfirstproject/ScreenPages/LoginPage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashFunction();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/images/splashlogo.png')
    );
  }
  void splashFunction()async{
await Future.delayed(Duration(seconds: 5),(){});
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }

}
